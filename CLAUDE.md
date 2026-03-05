# Unison Cloud HTTP Service — Development Notes

## Critical: Route is an ability, NOT a parameterized type

**Saved: ~10 iterations.** Most LLM training data and even the original plan gets this wrong.

```
-- WRONG (will waste many cycles):
postRoute : Route HttpRequest HttpResponse {Exception, Remote}

-- CORRECT:
postRoute : '{Route, Exception, Remote} ()
```

Route handlers are `'{Route, Exception, Remote} ()` — thunked computations with the `Route` ability. They don't take or return `HttpRequest`/`HttpResponse` directly. `Route.run` wraps them into an `HttpRequest -> HttpResponse` handler.

## Critical: Route composition pattern

**Saved: ~5 iterations.** The working pattern from the bundled `todoApp` example:

```unison
myRoutes =            -- NO `do` here! <|> already returns a thunk
  use Route <|>
  routeA : '{Route, Exception, Remote} ()
  routeA = do
    name = Route.route GET (s "hello" / Parser.text)
    respond.ok.text ("Hello, " ++ name)
  routeB : '{Route, Exception, Remote} ()
  routeB = do
    Route.noCapture GET (s "health")
    respond.ok.text "ok"
  routeA <|> routeB   -- compose at block level, NOT inside a `do`
```

Do NOT wrap the outer function in `do` — that double-thunks and gives "I didn't expect this expression to be delayed."

## Critical: `now!` is a name, not bang syntax

**Saved: ~3 iterations.** The `!` is part of the identifier.

```
-- WRONG: Remote.time.now, !Remote.time.now, Remote.time.now!
-- CORRECT: now!
```

`now!` has type `{Remote} Instant`. UCM will suggest it if you try `Remote.time.now`.

## High: APIs that don't exist (vs what does)

**Saved: ~3 iterations.** Common hallucinations and their real equivalents:

| Hallucinated API | Actual API |
|---|---|
| `OrderedTable.scan` / `OrderedTable.scan.tx` | `OrderedTable.toStream : OrderedTable k v -> '{Remote, Stream (k, v)} ()` |
| `Instant.epochSecond` | Does not exist. Use `Instant` directly as key (it has ordering). `fromEpochSeconds : Int -> Instant` goes the other direction. |
| `ok.text` / `ok.json` | `respond.ok.text` / `respond.ok.json` (both found via `find`) |

## High: `Cloud.main.local.serve` has two gotchas

**Saved: ~2 iterations.**

1. **Ambiguity**: Two versions exist (`unison_cloud_27_2_0` and `27_3_0`). Disambiguate:
   ```unison
   unison_cloud_27_3_0.Cloud.main.local.serve do ...
   ```

2. **Return type**: It returns whatever the body returns. If the body ends with `ServiceName.assign` (which returns `URI`), the function type is `'{IO, Exception} URI`, not `'{IO, Exception} ()`.

## Medium: `Nat.fromInt` returns `Optional Nat`

**Saved: ~1 iteration.** If you need a Nat key from an Int, you must handle the Optional. Easier to just use `Int` or `Instant` as the key type instead.

## Medium: `let` vs plain binding

**Saved: ~1 iteration.**

```
-- WRONG (errors with "last element must be an expression"):
let event = Event eventType msg

-- CORRECT:
event = Event eventType msg
```

## UCM Transcript Tips

- Commands need `> ` prefix: `> find Route.route`
- `find` with no results fails the transcript unless the block is tagged `` ```ucm:error ``
- `view` shows docs + source + type signature — very useful for learning APIs
- `debug.find.global` searches all namespaces (useful when `find` returns nothing)
- Non-`ucm`/`unison` fenced blocks are ignored (safe for plain documentation)
- Run with `ucm transcript.in-place -c .unison file.md` to execute against your codebase
- Run with `ucm transcript.fork -c .unison file.md` for sandboxed testing

## Source of Truth

The Unison codebase on [Unison Share](https://share.unison-lang.org/@ert485/starter-service) is canonical — not `eventlog.u`. The `.u` file is a scratch/reference file only.

- To modify the service: edit in UCM, then `push` to Share
- To deploy: `make deployLocal` (pulls from Share, then runs)
- `eventlog.u` is NOT loaded/added during deploy

## Project Setup Commands (UCM)

For a fresh clone:
```
make deployLocal    -- creates codebase, pulls from Share, auths, deploys
```

To push changes back to Share after editing in UCM:
```
push @ert485/starter-service
```

## Installed Library Versions (as of setup)

- `@unison/cloud` 27.3.0 (also pulls in 27.2.0 transitively — source of ambiguities)
- `@unison/routes` 7.0.2
- `@unison/json` 1.3.5 (transitive)

## File Index

| File | Purpose |
|------|---------|
| `README.md` | Primary onboarding entrypoint and quickstart |
| `eventlog.u` | Scratch/reference file (not used in deploy) |
| `scripts/setup.md` | UCM transcript — pulls project from Unison Share |
| `scripts/auth.md` | UCM transcript for interactive `auth.login` |
| `scripts/deployLocal.md` | UCM transcript — runs local deploy |
| `docs/discovery.md` | UCM `find`/`view` commands (runnable transcript) |
| `docs/discovery.output.md` | Raw UCM output from discovery |
| `docs/discovery.condensed.md` | Key signatures extracted from discovery |
| `docs/api-reference.md` | Reference doc with typechecked code example (runnable transcript) |
| `docs/api-reference.output.md` | UCM output confirming examples typecheck |
| `.unison/` | Local UCM codebase (gitignored — reconstructed via `pull` from Share) |
