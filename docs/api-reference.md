# Unison Cloud API Reference (discovered via UCM `find` / `view`)

## Key Type Signatures

### Route API

```
Route.route    : Method -> Parser (a ->{g} a) a ->{Route} a
Route.noCapture: Method -> Parser () b ->{Route} b
Route.run      : '{g, Route, Exception} () -> HttpRequest ->{g, Exception} HttpResponse
Route.<|>      : combines route handlers (used at block level)
```

**Pattern**: Routes are `'{Route, Exception, Remote} ()` — define as `do` blocks, compose with `<|>`:

```unison
myRoutes : '{Route, Exception, Remote} ()
myRoutes =
  use Route <|>
  routeA : '{Route, Exception, Remote} ()
  routeA = do
    name = Route.route GET (s "hello" / Parser.text)
    respond.ok.text ("Hello, " ++ name)
  routeB : '{Route, Exception, Remote} ()
  routeB = do
    Route.noCapture GET (s "health")
    respond.ok.text "ok"
  routeA <|> routeB
```

### Response helpers

```
respond.ok.text : Text ->{Route} ()
respond.ok.json : Json ->{Route} ()
respond.ok.html : Text ->{Route} ()
```

### Cloud / Deploy

```
Cloud.main.local.serve : '{IO, Exception, Cloud} a -> '{IO, Exception} a
deployHttp : Environment -> (HttpRequest ->{...many abilities...} HttpResponse) ->{Exception, Cloud} ServiceHash HttpRequest HttpResponse
Environment.default : '{Exception, Cloud} Environment
```

### Database / Storage

```
Database.named  : Text ->{Exception, Cloud} Database
Database.assign : Database -> Environment ->{Exception, Cloud} ()
OrderedTable.named : Database -> Text -> (k -> k -> Ordering) -> OrderedTable k v
OrderedTable.write : OrderedTable k v -> k -> v ->{Remote} ()
OrderedTable.read  : OrderedTable k v -> k ->{Remote} v
OrderedTable.delete: OrderedTable k v -> k ->{Remote} ()
OrderedTable.toStream : OrderedTable k v -> '{Remote, Stream (k, v)} ()
Storage.transact : Database -> '{Transaction, Exception, Random, Batch} a ->{Exception, Storage} a
```

### Time

```
now!              : {Remote} Instant       -- note: `!` is part of the name
fromEpochSeconds  : Int -> Instant
Instant.atOffset  : Instant -> UTCOffset -> OffsetDateTime
```

### JSON (`@unison/json`)

```
Json.object : [(Text, Json)] -> Json
Json.text   : Text -> Json
Json.array  : [Json] -> Json
```

### ServiceName

```
ServiceName.named  : Text ->{Exception, Cloud} ServiceName a b
ServiceName.assign : ServiceName a b -> ServiceHash a b ->{Exception, Cloud} URI
```

## Reference Example: todoApp routes

```
examples.todoApp.routes.todoService todoTable db =
  use Parser / s
  use Route <|> noCapture
  healthCheck = do
    name = noCapture GET (s "health")
    ok.text "ok"
  getTodoItems = do
    name = noCapture GET (s "todos")
    records = OrderedTable.toStream todoTable |> Stream.toList
    jsonRecords = Json.array (List.map (r -> at2 r |> toJson) records)
    ok.json jsonRecords
  getTodoItem = do
    id = route GET (s "todo" / Parser.text)
    match catch do OrderedTable.read todoTable id with
      Right todoItem -> ok.json (toJson todoItem)
      Left _ -> notFound.text ("todo item not found " ++ id)
  getTodoItem <|> getTodoItems <|> healthCheck
```

## Common Gotchas

- `Route` is an **ability**, not a parameterized type — route handlers are `'{Route, ...} ()`
- `now!` has the `!` as part of its name (not bang/force syntax)
- `Nat.fromInt` returns `Optional Nat` — use `Int` keys or handle the Optional
- When two lib versions exist (e.g. `unison_cloud_27_2_0` vs `27_3_0`), disambiguate with full path
- `Cloud.main.local.serve` returns whatever the body returns (often `URI` from `ServiceName.assign`)
- `OrderedTable.toStream` streams `(k, v)` pairs; use `Stream.toList` to collect
