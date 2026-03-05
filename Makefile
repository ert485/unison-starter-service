.PHONY: help setup auth deployLocal testApi clean clean-all

SERVICE_URL ?= http://localhost:8080/s/event-log
EVENT_TYPE ?= exampleEvent
UCM_CREDENTIALS ?= $(HOME)/.local/share/unisonlanguage/credentials.json
UCM_AUTH_SKEW_SECONDS ?= 60

help:
	@echo "Quick path:"
	@echo "  1) make deployLocal   # Includes setup + auth (opens browser if needed), then starts service"
	@echo "  2) In another terminal while it runs: make testApi"
	@echo ""
	@echo "Targets:"
	@echo "  make setup        # Create local codebase and run one-time project/library setup"
	@echo "  make auth         # Login only if needed (opens browser when credentials are missing/expired)"
	@echo "  make deployLocal  # Load code, add definitions, and run local service"
	@echo "  make testApi      # Smoke test local /events endpoints"
	@echo "  make clean        # Remove local project codebase (.unison)"
	@echo "  make clean-all    # DANGEROUS: remove local .unison and global ~/.unison/v2 state"
	@echo ""
	@echo "Options:"
	@echo "  EVENT_TYPE=name   # Event type used for POST /events/<eventType>"
	@echo "  UCM_AUTH_SKEW_SECONDS=n  # Treat auth as expired n seconds early (default: 60)"
	@echo "  FORCE_AUTH=1      # Force browser login even if local credentials exist"
	@echo "  CONFIRM=1         # Required for clean-all"

setup:
	@if [ ! -d .unison/.unison/v2 ]; then \
		echo "Initializing local codebase at .unison"; \
		ucm --codebase-create .unison --exit; \
	fi
	@if [ ! -f .unison/.setup-complete ]; then \
		echo "Running one-time setup transcript"; \
		ucm transcript.in-place -c .unison scripts/setup.md && touch .unison/.setup-complete; \
	fi

auth: setup
	@if [ "$(FORCE_AUTH)" = "1" ]; then \
		echo "FORCE_AUTH=1 set; running auth flow"; \
		ucm transcript.in-place -c .unison scripts/auth.md; \
	elif [ -s "$(UCM_CREDENTIALS)" ] && command -v python3 >/dev/null 2>&1 && python3 scripts/check_ucm_auth_valid.py "$(UCM_CREDENTIALS)" "$(UCM_AUTH_SKEW_SECONDS)"; then \
		echo "Auth appears valid ($(UCM_CREDENTIALS)); skipping browser login"; \
	else \
		ucm transcript.in-place -c .unison scripts/auth.md; \
	fi

deployLocal: auth
	ucm transcript.in-place -c .unison scripts/deployLocal.md

testApi:
	curl -i --max-time 10 $(SERVICE_URL)/events
	curl -i --max-time 10 -X POST $(SERVICE_URL)/events/$(EVENT_TYPE)
	curl -i --max-time 10 $(SERVICE_URL)/events

clean:
	rm -rf .unison
	@echo "Removed local project state: .unison"

clean-all:
	@echo "WARNING: clean-all will delete:"
	@echo "  1) Project-local codebase: .unison"
	@echo "  2) Global UCM state: ~/.unison/v2 (local projects/history/auth state)"
	@if [ "$(CONFIRM)" != "1" ]; then \
		echo "Refusing to run destructive clean-all without CONFIRM=1"; \
		echo "Run: make clean-all CONFIRM=1"; \
		exit 1; \
	fi
	rm -rf .unison ~/.unison/v2
	@echo "Removed .unison and ~/.unison/v2"
