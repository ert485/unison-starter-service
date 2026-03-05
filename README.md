# Unison Starter Service

A small, intentionally simple Unison Cloud HTTP service meant for:

- learning core Unison Cloud patterns
- serving as a clean starting point for new projects

## Quickstart

Prereqs:

- `ucm` installed
- Unison Cloud account

Run in order:

1. `make deployLocal` (runs setup, performs auth if needed, loads `eventlog.u`, adds definitions, runs local service)
2. In another terminal while it is running: `make testApi`

Notes:

- `make auth` is optional; it only opens the browser when local credentials are missing or expired
- use `make auth FORCE_AUTH=1` to force a fresh login

You can customize the POST event type for the smoke test:

```bash
make testApi EVENT_TYPE=signup
```

Expected `make testApi` output (happy path):

1. First `GET /events` returns `HTTP/1.1 200 OK` with body `[]` on a fresh run
2. `POST /events/<eventType>` returns `HTTP/1.1 200 OK` with body `stored`
3. Final `GET /events` returns `HTTP/1.1 200 OK` with a JSON array containing the inserted event, for example:

```json
[{"eventType":"exampleEvent","message":"Event of type: exampleEvent"}]
```

## Project Layout

- `eventlog.u`: Minimal service implementation
- `scripts/setup.md`: UCM transcript for one-time project/library setup
- `scripts/deployLocal.md`: UCM transcript for local deploy
- `scripts/auth.md`: UCM transcript for interactive cloud login
- `docs/discovery.md`: API discovery transcript commands
- `docs/discovery.output.md`: Raw UCM discovery output
- `docs/discovery.condensed.md`: Condensed discovery notes
- `docs/api-reference.md`: Curated API reference
- `docs/api-reference.output.md`: UCM output for API reference checks
- `CLAUDE.md`: Practical gotchas and implementation notes

Layout overview:

- define routes in `eventlog.u`
- deploy with a transcript
- smoke-test with curl via `make testApi`
