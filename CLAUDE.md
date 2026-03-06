# Unison Cloud HTTP Service — Development Notes
Notes that Claude added:

## Critical: Route is an ability, NOT a parameterized type

Route handlers are `'{Route, Exception, Remote} ()` — thunked computations with the `Route` ability. They don't take or return `HttpRequest`/`HttpResponse` directly. `Route.run` wraps them into an `HttpRequest -> HttpResponse` handler.

## Critical: Route composition pattern

The outer routes function must NOT be wrapped in `do` — `<|>` already returns a thunk. Wrapping in `do` double-thunks and gives "I didn't expect this expression to be delayed." See `eventlog.u` for the working pattern.

## Critical: `now!` is a name, not bang syntax

The `!` is part of the identifier. `now!` has type `{Remote} Instant`.

## APIs that don't exist (vs what does)

Common hallucinations and their real equivalents (see `docs/discovery.condensed.md` for verified signatures):

| Hallucinated API | Actual API |
|---|---|
| `OrderedTable.scan` / `OrderedTable.scan.tx` | `OrderedTable.toStream` |
| `Instant.epochSecond` | Does not exist. Use `Instant` directly as key (it has ordering). |
| `ok.text` / `ok.json` | `respond.ok.text` / `respond.ok.json` |
| `Route.body` / `Route.requestBody` | `Route.request.body.decodeJson` |

## `Cloud.main.local.serve` has two gotchas

1. **Ambiguity**: Two versions exist (`unison_cloud_27_2_0` and `27_3_0`). Disambiguate with full path.
2. **Return type**: Returns whatever the body returns. If the body ends with `ServiceName.assign` (returns `URI`), the function type is `'{IO, Exception} URI`, not `()`.

## Unison syntax gotchas

- `Nat.fromInt` returns `Optional Nat` — easier to just use `Int` or `Instant` as key types
- Use plain binding (`event = ...`), not `let` binding (`let event = ...`) — the latter errors with "last element must be an expression"

## UCM Transcript Tips

- Commands need `> ` prefix: `> find Route.route`
- `find` with no results fails the transcript unless the block is tagged `` ```ucm:error ``
- `debug.find.global` searches all namespaces (useful when `find` returns nothing)
- UCM has no `-e` / inline command flag — all commands require a transcript `.md` file
- Transcript files must have `.md` or `.markdown` extension (no piping to stdin)
- To push `.u` file changes to Share: `load eventlog.u` → `update` → `push @ert485/starter-service` (all in one transcript)

## Source of Truth

[Unison Share](https://share.unison-lang.org/@ert485/starter-service) is canonical — not `eventlog.u`. The `.u` file is a scratch/reference file only. See `README.md` for setup commands and workflow.

## Installed Library Versions (as of setup)

- `@unison/cloud` 27.3.0 (also pulls in 27.2.0 transitively — source of ambiguities)
- `@unison/routes` 7.0.2
- `@unison/json` 1.3.5 (transitive)

## File Index

See `README.md` for project layout. Key files for AI context: `eventlog.u` (reference code), `docs/discovery.condensed.md` (verified API signatures).

## Notes that Erik added:

- When the AI is about to run a transcripts, I often forget to kill other ucm processes (port occupied)
- Codex struggles to understand mindshift changes in Unison (e.g. the .u files are scratch pads, not source of truth)
- Claude Code isn't able to handle running interactive process as well as Codex, I'm having to run ucm outside of Claude Code
- Claude Code sometimes uses `>>` (append redirect) in Bash to write files, which triggers a permission prompt even with accept edits enabled — use the Write/Edit tools instead
