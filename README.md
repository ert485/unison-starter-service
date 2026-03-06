# Unison Starter Service

A small, intentionally simple Unison Cloud HTTP service meant for:

- learning core Unison Cloud patterns
- serving as a clean starting point for new projects

## Quickstart

Prereqs:

- `ucm` installed
- Unison Cloud account

Run in order:

1. `make deployLocal` (runs setup, performs auth if needed, pulls from Share, runs local service)
2. In another terminal while it is running: `make testApi`

Notes:

- `make auth` is optional; it only opens the browser when local credentials are missing or expired
- use `make auth FORCE_AUTH=1` to force a fresh login

Expected `make testApi` output (happy path):

1. First `GET /events` returns `HTTP/1.1 200 OK` with body `[]` on a fresh run
2. `POST /events` with a JSON body returns `HTTP/1.1 200 OK` with body `stored`
3. Final `GET /events` returns `HTTP/1.1 200 OK` with a JSON array containing the inserted event, for example:

```json
[{"eventType":"signup","message":"A user signed up"}]
```

## How it works

The Unison codebase on [Unison Share](https://share.unison-lang.org/@ert485/starter-service) is the source of truth — not the `.u` files. The `eventlog.u` file is kept as a scratch/reference file, but the deploy workflow pulls code from Share, not from the text file.

To modify the service, use UCM to edit code in the codebase, then `push` to Share.

## Project Layout

- `eventlog.u`: Scratch/reference file (not used in deploy)
- `scripts/setup.md`: UCM transcript — pulls project from Unison Share
- `scripts/deployLocal.md`: UCM transcript — runs local deploy
- `scripts/auth.md`: UCM transcript for interactive cloud login
- `docs/`: API discovery notes and reference docs
- `CLAUDE.md`: Practical gotchas and implementation notes
