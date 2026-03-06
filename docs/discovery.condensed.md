# API Discovery (condensed)

Only the primary type signatures and key examples extracted from `discovery.output.md`.

## Storage

```
OrderedTable.named    : Database -> Text -> (k -> k -> Ordering) -> OrderedTable k v
OrderedTable.write.tx : OrderedTable k v -> k -> v ->{Transaction, Random} ()
OrderedTable.toStream : OrderedTable k v -> '{Remote, Stream (k, v)} ()
Database.named        : Text ->{Exception, Cloud} Database
Database.assign       : Database -> Environment ->{Exception, Cloud} ()
Environment.default   : '{Exception, Cloud} Environment
```

## Routes

```
Route.route     : Method -> Parser (a ->{g} a) a ->{Route} a
Route.noCapture : Method -> Parser () b ->{Route} b
Route.run       : '{g, Route, Exception} () -> HttpRequest ->{g, Exception} HttpResponse
respond.ok.text : Text ->{Route} ()
respond.ok.json : Json ->{Route} ()
Route.request.body.decodeJson : '{g, Decoder} a ->{g, Route, Exception} a
```

## Cloud / Deploy

```
Cloud.main.local.serve : '{IO, Exception, Cloud} a -> '{IO, Exception} a
  -- note: two versions exist (27_2_0 and 27_3_0), disambiguate with full path

deployHttp : Environment
             -> (HttpRequest ->{Environment.Config, Exception, Http, Blobs,
                                Services, Storage, Remote, Random, Log,
                                Scratch} HttpResponse)
             ->{Exception, Cloud} ServiceHash HttpRequest HttpResponse
```

## Service Names

```
ServiceName.named  : Text ->{Exception, Cloud} ServiceName a b
ServiceName.assign : ServiceName a b -> ServiceHash a b ->{Exception, Cloud} URI
```

## JSON

```
Json.object        : [(Text, Json)] -> Json
Decoder.text       : '{Decoder} Text
Decoder.object.at  : Text -> '{g, Decoder} a -> '{g, Decoder} a
Decoder.object.at! : Text -> '{g, Decoder} a ->{g, Decoder} a
```

## Time

```
Remote.time.now! : {Remote} Instant
```

## Key pattern: Route composition (from todoApp example)

```unison
todoService todoTable db =
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
