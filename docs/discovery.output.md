# API Discovery

Key finds that informed the eventlog service implementation.

```` ucm
> find OrderedTable.named

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.durable.OrderedTable.named : Database
                                                          -> Text
                                                          -> (k
                                                          -> k
                                                          -> Ordering)
                                                          -> OrderedTable
                                                            k v
  2. lib.unison_cloud_27_2_0.durable.OrderedTable.named.doc : Doc
  3. lib.unison_cloud_27_2_0.durable.OrderedTable.named.makeGuid : name
                                                                   -> Bytes

> find OrderedTable.write.tx

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.durable.OrderedTable.write.tx : OrderedTable
                                                               k
                                                               v
                                                             -> k
                                                             -> v
                                                             ->{Transaction,
                                                             Random} ()
  2. lib.unison_cloud_27_2_0.durable.OrderedTable.write.tx.doc : Doc

> find OrderedTable.toStream

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream : OrderedTable
                                                                k
                                                                v
                                                              -> '{Remote,
                                                              Stream
                                                                ( k,
                                                                  v)} ()
  2.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.doc : Doc
  3.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys : OrderedTable
                                                                     k
                                                                     v
                                                                   -> '{Remote,
                                                                   Stream
                                                                     k} ()
  4.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.chunked : OrderedTable
                                                                             k
                                                                             v
                                                                           -> '{Remote,
                                                                           Stream
                                                                             [k]} ()
  5.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.chunked.doc : Doc
  6.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.chunked.tx : OrderedTable
                                                                                k
                                                                                v
                                                                              -> '{Transaction,
                                                                              Stream
                                                                                [k]} ()
  7.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.chunked.tx.doc : Doc
  8.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.doc : Doc
  9.  lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.tx : OrderedTable
                                                                        k
                                                                        v
                                                                      -> '{Transaction,
                                                                      Stream
                                                                        k} ()
  10. lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.keys.tx.doc : Doc
  11. lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.tx : OrderedTable
                                                                   k
                                                                   v
                                                                 -> '{Transaction,
                                                                 Batch,
                                                                 Stream
                                                                   ( k,
                                                                     v)} ()
  12. lib.unison_cloud_27_2_0.durable.OrderedTable.toStream.tx.doc : Doc

> find Route.route

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1.  lib.unison_routes_7_0_1.Route.route : Method
                                            -> Parser
                                              (a ->{g} a) a
                                            ->{Route} a
  2.  lib.unison_routes_7_0_1.Route.route.doc : Doc
  3.  lib.unison_routes_7_0_1.Route.route.pair : Method
                                                 -> Parser
                                                   (a
                                                   ->{f} c
                                                   ->{g} (a, c))
                                                   b
                                                 ->{Route} b
  4.  lib.unison_routes_7_0_1.Route.route.pair.doc : Doc
  5.  lib.unison_routes_7_0_1.Route.route.tuple3 : Method
                                                   -> Parser
                                                     (a
                                                     ->{f} c
                                                     ->{g} d
                                                     ->{h} ( a,
                                                       c,
                                                       d))
                                                     b
                                                   ->{Route} b
  6.  lib.unison_routes_7_0_1.Route.route.tuple3.doc : Doc
  7.  lib.unison_routes_7_0_1.Route.route.tuple4 : Method
                                                   -> Parser
                                                     (a
                                                     ->{g3} b1
                                                     ->{g2} c
                                                     ->{g1} d
                                                     ->{g} ( a,
                                                       b1,
                                                       c,
                                                       d))
                                                     b
                                                   ->{Route} b
  8.  lib.unison_routes_7_0_1.Route.route.tuple4.doc : Doc
  9.  lib.unison_routes_7_0_1.Route.routes : ['{g, Route} a]
                                             -> '{g, Route} a
  10. lib.unison_routes_7_0_1.Route.routes.doc : Doc
  11. lib.unison_routes_7_0_1.Route.routes.test : [test.Result]
  12. lib.unison_routes_7_0_2.Route.routes.doc : Doc
  13. lib.unison_routes_7_0_2.Route.routes.test : [test.Result]

> find Route.noCapture

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_routes_7_0_1.Route.noCapture : Method
                                               -> Parser () b
                                               ->{Route} b
  2. lib.unison_routes_7_0_1.Route.noCapture.doc : Doc

> find Route.run

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_routes_7_0_1.Route.run : '{g, Route, Exception} ()
                                         -> HttpRequest
                                         ->{g, Exception} HttpResponse
  2. lib.unison_routes_7_0_1.Route.run.doc : Doc
  3. lib.unison_routes_7_0_1.Route.run.impl : '{g, Route} ()
                                              -> HttpRequest
                                              ->{g, Exception} HttpResponse
  4. lib.unison_routes_7_0_1.Route.runWebSocketCloud : '{Route,
                                                       Environment.Config,
                                                       Exception,
                                                       Http,
                                                       OpenWebSocket,
                                                       Blobs,
                                                       Services,
                                                       unison_cloud_27_2_0.Storage,
                                                       Remote,
                                                       WebSockets,
                                                       Random,
                                                       Log,
                                                       Scratch} ()
                                                       -> HttpRequest
                                                       ->{Environment.Config,
                                                       Exception,
                                                       Http,
                                                       Blobs,
                                                       Services,
                                                       unison_cloud_27_2_0.Storage,
                                                       Remote,
                                                       Random,
                                                       Log,
                                                       Scratch} Either
                                                         HttpResponse
                                                         (unison_cloud_27_2_0.websockets.WebSocket
                                                         ->{Exception,
                                                         Remote,
                                                         WebSockets} ())
  5. lib.unison_routes_7_0_1.Route.runWebSocketCloud.doc : Doc
  6. lib.unison_routes_7_0_1.Route.runWebSocketIO : '{g,
                                                    Route,
                                                    OpenWebSocket,
                                                    WebSockets} ()
                                                    -> HttpRequest
                                                    ->{g,
                                                    IO,
                                                    Exception} Either
                                                      HttpResponse
                                                      (unison_cloud_27_2_0.websockets.WebSocket
                                                      ->{g,
                                                      IO,
                                                      Exception,
                                                      WebSockets} ())
  7. lib.unison_routes_7_0_1.Route.runWebSocketIO.doc : Doc
  8. lib.unison_routes_7_0_2.Route.runWebSocketCloud.doc : Doc
  9. lib.unison_routes_7_0_2.Route.runWebSocketIO.doc : Doc

> find Cloud.main.local.serve

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.Cloud.main.local.serve : '{IO,
                                                      Exception,
                                                      Cloud} a
                                                      -> '{IO,
                                                      Exception} a
  2. lib.unison_cloud_27_3_0.Cloud.main.local.serve : '{IO,
                                                      Exception,
                                                      Cloud} a
                                                      -> '{IO,
                                                      Exception} a
  3. lib.unison_cloud_27_2_0.Cloud.main.local.serve.doc : Doc
  4. lib.unison_cloud_27_3_0.Cloud.main.local.serve.doc : Doc

> find deployHttp

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1.  lib.unison_cloud_27_2_0.Cloud.deployHttp : Environment
                                                 -> (HttpRequest
                                                 ->{Environment.Config,
                                                 Exception,
                                                 Http,
                                                 Blobs,
                                                 Services,
                                                 unison_cloud_27_2_0.Storage,
                                                 Remote,
                                                 Random,
                                                 Log,
                                                 Scratch} HttpResponse)
                                                 ->{Exception,
                                                 Cloud} ServiceHash
                                                   HttpRequest
                                                   HttpResponse
  2.  lib.unison_cloud_27_2_0.Cloud.deployHttp.doc : Doc
  3.  lib.unison_cloud_27_2_0.Cloud.deployHttp.doc.example : '{IO,
                                                             Exception,
                                                             Cloud} ServiceHash
                                                               HttpRequest
                                                               HttpResponse
  4.  lib.unison_cloud_27_2_0.Cloud.deployHttp.remote : Environment
                                                        -> (HttpRequest
                                                        ->{Remote} HttpResponse)
                                                        ->{Exception,
                                                        Cloud} ServiceHash
                                                          HttpRequest
                                                          HttpResponse
  5.  lib.unison_cloud_27_2_0.Cloud.deployHttp.remote.doc : Doc
  6.  lib.unison_cloud_27_2_0.Cloud.deployHttpWebSocket : Environment
                                                          -> (HttpRequest
                                                          ->{Environment.Config,
                                                          Exception,
                                                          Http,
                                                          Blobs,
                                                          Services,
                                                          unison_cloud_27_2_0.Storage,
                                                          Remote,
                                                          Random,
                                                          Log,
                                                          Scratch} Either
                                                            HttpResponse
                                                            (unison_cloud_27_2_0.websockets.WebSocket
                                                            ->{Exception,
                                                            Remote,
                                                            WebSockets} ()))
                                                          ->{Exception,
                                                          Cloud} ServiceHash
                                                            HttpRequest
                                                            (Either
                                                              HttpResponse
                                                              (unison_cloud_27_2_0.websockets.WebSocket
                                                              ->{Remote,
                                                              WebSockets} ()))
  7.  lib.unison_cloud_27_2_0.Cloud.deployHttpWebSocket.doc : Doc
  8.  lib.unison_cloud_27_2_0.Cloud.deployHttpWebSocket.remote : Environment
                                                                 -> (HttpRequest
                                                                 ->{Remote} Either
                                                                   HttpResponse
                                                                   (unison_cloud_27_2_0.websockets.WebSocket
                                                                   ->{Exception,
                                                                   Remote,
                                                                   WebSockets} ()))
                                                                 ->{Exception,
                                                                 Cloud} ServiceHash
                                                                   HttpRequest
                                                                   (Either
                                                                     HttpResponse
                                                                     (unison_cloud_27_2_0.websockets.WebSocket
                                                                     ->{Remote,
                                                                     WebSockets} ()))
  9.  lib.unison_cloud_27_2_0.Cloud.deployHttpWebSocket.remote.doc : Doc
  10. lib.unison_cloud_27_2_0.provisional.Cloud.deployHttpStaged : Environment
                                                                   -> Database
                                                                   -> '{Remote} ( (HttpRequest
                                                                   ->{Remote} HttpResponse),
                                                                     '{Remote} ())
                                                                   ->{Exception,
                                                                   Cloud} ServiceHash
                                                                     HttpRequest
                                                                     HttpResponse
  11. lib.unison_cloud_27_2_0.provisional.Cloud.deployHttpStaged.doc : Doc
  12. lib.unison_cloud_27_3_0.provisional.Cloud.deployHttpStaged.doc : Doc

> find ok.text

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_routes_7_0_1.Route.respond.ok.text : Text
                                                     ->{Route} ()
  2. lib.unison_routes_7_0_1.Route.respond.ok.text.doc : Doc

> find ok.json

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_routes_7_0_1.Route.respond.ok.json : Json
                                                     ->{Route} ()
  2. lib.unison_routes_7_0_1.Route.respond.ok.json.doc : Doc

> find Json.object

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1.  lib.unison_json_1_3_5.core.Json.object : [(Text, Json)]
                                               -> Json
  2.  lib.unison_json_1_3_5.core.Json.object.add : Text
                                                   -> Json
                                                   -> Json
                                                   -> Json
  3.  lib.unison_json_1_3_5.core.Json.object.add.doc : Doc
  4.  lib.unison_json_1_3_5.core.Json.object.addBoolean : Text
                                                          -> Boolean
                                                          -> Json
                                                          -> Json
  5.  lib.unison_json_1_3_5.core.Json.object.addBoolean.doc : Doc
  6.  lib.unison_json_1_3_5.core.Json.object.addFloat : Text
                                                        -> Float
                                                        -> Json
                                                        -> Json
  7.  lib.unison_json_1_3_5.core.Json.object.addFloat.doc : Doc
  8.  lib.unison_json_1_3_5.core.Json.object.addInt : Text
                                                      -> Int
                                                      -> Json
                                                      -> Json
  9.  lib.unison_json_1_3_5.core.Json.object.addInt.doc : Doc
  10. lib.unison_json_1_3_5.core.Json.object.addList : Text
                                                       -> [Json]
                                                       -> Json
                                                       -> Json
  11. lib.unison_json_1_3_5.core.Json.object.addList.doc : Doc
  12. lib.unison_json_1_3_5.core.Json.object.addMap : Text
                                                      -> Map
                                                        Text
                                                        Json
                                                      -> Json
                                                      -> Json
  13. lib.unison_json_1_3_5.core.Json.object.addMap.doc : Doc
  14. lib.unison_json_1_3_5.core.Json.object.addNat : Text
                                                      -> Nat
                                                      -> Json
                                                      -> Json
  15. lib.unison_json_1_3_5.core.Json.object.addNat.doc : Doc
  16. lib.unison_json_1_3_5.core.Json.object.addOptional : Text
                                                           -> Optional
                                                             Json
                                                           -> Json
                                                           -> Json
  17. lib.unison_json_1_3_5.core.Json.object.addOptional.doc : Doc
  18. lib.unison_json_1_3_5.core.Json.object.addOptionalBoolean : Text
                                                                  -> Optional
                                                                    Boolean
                                                                  -> Json
                                                                  -> Json
  19. lib.unison_json_1_3_5.core.Json.object.addOptionalBoolean.doc : Doc
  20. lib.unison_json_1_3_5.core.Json.object.addOptionalFloat : Text
                                                                -> Optional
                                                                  Float
                                                                -> Json
                                                                -> Json
  21. lib.unison_json_1_3_5.core.Json.object.addOptionalFloat.doc : Doc
  22. lib.unison_json_1_3_5.core.Json.object.addOptionalInt : Text
                                                              -> Optional
                                                                Int
                                                              -> Json
                                                              -> Json
  23. lib.unison_json_1_3_5.core.Json.object.addOptionalInt.doc : Doc
  24. lib.unison_json_1_3_5.core.Json.object.addOptionalList : Text
                                                               -> Optional
                                                                 [Json]
                                                               -> Json
                                                               -> Json
  25. lib.unison_json_1_3_5.core.Json.object.addOptionalList.doc : Doc
  26. lib.unison_json_1_3_5.core.Json.object.addOptionalMap : Text
                                                              -> Optional
                                                                (Map
                                                                  Text
                                                                  Json)
                                                              -> Json
                                                              -> Json
  27. lib.unison_json_1_3_5.core.Json.object.addOptionalMap.doc : Doc
  28. lib.unison_json_1_3_5.core.Json.object.addOptionalNat : Text
                                                              -> Optional
                                                                Nat
                                                              -> Json
                                                              -> Json
  29. lib.unison_json_1_3_5.core.Json.object.addOptionalNat.doc : Doc
  30. lib.unison_json_1_3_5.core.Json.object.addOptionalText : Text
                                                               -> Optional
                                                                 Text
                                                               -> Json
                                                               -> Json
  31. lib.unison_json_1_3_5.core.Json.object.addOptionalText.doc : Doc
  32. lib.unison_json_1_3_5.core.Json.object.addText : Text
                                                       -> Text
                                                       -> Json
                                                       -> Json
  33. lib.unison_json_1_3_5.core.Json.object.addText.doc : Doc
  34. lib.unison_json_1_3_5.core.Json.object.empty : Json
  35. lib.unison_json_1_3_5.core.Json.object.empty.doc : Doc
  36. lib.unison_json_1_3_5.core.Json.Object : [(Text, Json)]
                                               -> Json

> find Database.named

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.Database.named : Text
                                              ->{Exception,
                                              Cloud} Database
  2. lib.unison_cloud_27_2_0.Database.named.doc : Doc

> find Database.assign

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.Database.assign : Database
                                               -> Environment
                                               ->{Exception,
                                               Cloud} ()
  2. lib.unison_cloud_27_2_0.Cloud.Database.assign.impl : Database
                                                          -> Environment
                                                          ->{Cloud} Either
                                                            Failure
                                                            ()
  3. lib.unison_cloud_27_2_0.Database.assign.doc : Doc

> find Environment.default

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.Environment.default : '{Exception,
                                                   Cloud} Environment
  2. lib.unison_cloud_27_2_0.Environment.default.doc : Doc

> find ServiceName.named

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.ServiceName.named : Text
                                                 ->{Exception,
                                                 Cloud} ServiceName
                                                   a b
  2. lib.unison_cloud_27_2_0.ServiceName.named.doc : Doc

> find ServiceName.assign

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.ServiceName.assign : ServiceName
                                                    a b
                                                  -> ServiceHash
                                                    a b
                                                  ->{Exception,
                                                  Cloud} URI
  2. lib.unison_cloud_27_2_0.Cloud.ServiceName.assign.impl : ServiceName
                                                               a
                                                               b
                                                             -> ServiceHash
                                                               a
                                                               b
                                                             ->{Cloud} Either
                                                               Failure
                                                               URI
  3. lib.unison_cloud_27_2_0.ServiceName.assign.doc : Doc
  4. lib.unison_cloud_27_2_0.internal.tests.cloud.serviceName.assignViaId : Environment
                                                                            ->{Exception,
                                                                            Random,
                                                                            Cloud} ()

> find Remote.time

  ☝️

  I couldn't find matches in this namespace, searching in
  'lib'...

  1. lib.unison_cloud_27_2_0.Remote.time.monotonic! : {Remote} time.Duration
  2. lib.unison_cloud_27_2_0.Remote.time.monotonic!.doc : Doc
  3. lib.unison_cloud_27_2_0.Remote.time.now! : {Remote} Instant
  4. lib.unison_cloud_27_2_0.Remote.time.now!.doc : Doc
  5. lib.unison_cloud_27_2_0.Remote.timeout : Remote.Duration
                                              -> '{Remote} a
                                              ->{Remote} a
  6. lib.unison_cloud_27_2_0.Remote.timeout.doc : Doc
  7. lib.unison_cloud_27_3_0.Remote.time.monotonic!.doc : Doc
  8. lib.unison_cloud_27_3_0.Remote.time.now!.doc : Doc
  9. lib.unison_cloud_27_3_0.Remote.timeout.doc : Doc

> view Route.route

  {{
  `` route m p `` parses the request URI using the given
  {type Parser}, and if successful, returns the result of the
  parser.

  If the request method does not match the given method, the
  route is skipped, as in the case of {Route.skip}. If the
  parser does not match, the route is skipped as well.

  See {type Parser} for more on matching on the components of
  the request URI, but a few examples are given below.

  # Capturing a single path component

    This route matches a request for `GET /hello/<name>` and
    responds with a greeting:
    
    @typecheck ```
    do
      use Parser /
      use Text ++
      name = route GET (Parser.s "hello" / Parser.text)
      ok.text ("👋 Hello, " ++ name ++ "!")
    ```

  # Capturing multiple path components

    This route matches a request for `GET /hello/<name>/<age>`,
    captures them as a pair, and responds with a greeting:
    
    @typecheck ```
    do
      use Parser /
      use Text ++
      (name, age) =
        route
          GET
          (Parser.s "hello" / Parser.text / Parser.nat
            => Tuple.pair)
      ok.text
        ("👋 Hello, "
          ++ name
          ++ "! You are "
          ++ Nat.toText age
          ++ " years old.")
    ```

  # Capturing query parameters

    This route matches a request for
    `GET /hello?name=<name>&age=<age>`, captures them as a pair,
    and responds with a greeting. The `age` parameter is
    optional, and if it is not provided, the route will still
    match. The `name` parameter is required, and if it is not
    provided, the route will fail with a `400 Bad Request`
    response:
    
    @typecheck ```
    do
      use Text ++
      use unison_uri_parser_2_1_5.Parser &
      (name, age) =
        route
          GET (Parser.s "hello" & (do
            name = ParseQuery.required ParseQuery.text "name"
            age = ParseQuery.nat "age"
            (name, age)))
      ok.text
        ("👋 Hello, "
          ++ name
          ++ "!"
          ++ (match age with
               Some n ->
                 " You are " ++ Nat.toText n ++ " years old."
               Optional.None -> ""))
    ```

  # Matching on the URI regardless of the method

    To match on the URI regardless of the method, use
    {Route.uri} instead of {route}:
    
    @typecheck ```
    do
      use Parser /
      use Text ++
      name = Route.uri (Parser.s "hello" / Parser.text)
      ok.text ("👋 Hello, " ++ name ++ "!")
    ```

  # Matching on the URI and method without capturing anything

    If you want to match on the URI and method, but don't want
    to capture any parameters, you can use {Route.noCapture}:
    
    @typecheck ```
    do
      Route.noCapture GET (Parser.s "hello")
      ok.text "👋 Hello, World!"
    ```

  # Marking URL components as required

    You can use {Parser.required} or {ParseQuery.required} to
    mark a path segment or query parameter, respectively, as
    required. If the parser does not match those components, the
    route will fail with a `400 Bad Request` response:
    
    @typecheck ```
    do
      use Parser /
      use Text ++
      name =
        route
          GET (Parser.s "hello" / Parser.required Parser.text)
      ok.text ("👋 Hello, " ++ name ++ "!")
    ```
    
    You can override this behavior by using {tryRoute} instead
    of {route} if you want to handle the error yourself:
    
    @typecheck ```
    do
      use Parser /
      use Text ++
      name = 
        toEither do
          tryRoute
            GET (Parser.s "post" / Parser.required Parser.nat)
      match name with
        Left _ ->
          respond.badRequest
            (Text.toUtf8 "You must provide a post number")
        Right name ->
          ok.text ("You requested post #" ++ Nat.toText name)
    ```
  }}
  lib.unison_routes_7_0_1.Route.route :
    Method -> Parser (a ->{g} a) a ->{Route} a
  lib.unison_routes_7_0_1.Route.route m p = 
    catchWith (Route.skip << uriParseFailure) do tryRoute m p

> view Route.noCapture

  {{
  Matches a request with the given method and path parser, but
  doesn't capture any parameters from the URI.

  # Example

    This responds to a GET request to `/hello` with the text
    `👋 Hello!`:
    
    @typecheck ```
    do
      Route.noCapture GET (Parser.s "hello")
      ok.text "👋 Hello!"
    ```

  # See also

    * {route} - captures the path parameters.
  }}
  lib.unison_routes_7_0_1.Route.noCapture :
    Method -> Parser () b ->{Route} b
  lib.unison_routes_7_0_1.Route.noCapture m p =
    route m (Parser.noCapture p)

> view Route.run

  {{
  Runs the given route with the given {type HttpRequest} and
  returns the {type HttpResponse}.

  Note that this can't do streaming requests or responses. Use
  {streaming} for streaming applications.
  }}
  lib.unison_routes_7_0_1.Route.run :
    '{g, Route, Exception} ()
    -> HttpRequest
    ->{g, Exception} HttpResponse
  lib.unison_routes_7_0_1.Route.run r =
    use Route <|>
    run.impl (r <|> (do respond.notFound 0xs))

> view examples.todoApp.routes.todoService

  {{
  {{ docLink (docEmbedTermLink do routes.todoService) }} defines
  the following routes:

  * GET /health - returns "ok 👍" if the service is running
  * GET /todo/<id> - returns the todo item with the given id
  * GET /todos - returns all todo items
  * PUT /todo - creates or updates a {type TodoItem}
  * DELETE /todo/<id> - deletes the todo item with the given id
  }}
  examples.todoApp.routes.todoService :
    OrderedTable Text TodoItem
    -> Database
    -> '{Route,
    Exception,
    unison_cloud_27_2_0.Storage,
    Remote,
    Log} ()
  examples.todoApp.routes.todoService todoTable db =
    use Parser / s
    use Route <|> noCapture
    use Text ++
    use TodoItem toJson
    healthCheck : '{Route, Exception, Remote} ()
    healthCheck = do
      name = noCapture GET (s "health")
      ok.text "ok 👍"
    getTodoItem : '{Route, Exception, Remote} ()
    getTodoItem =
      do
        id = route GET (s "todo" / Parser.text)
        match catch do OrderedTable.read todoTable id with
          Right todoItem -> ok.json (toJson todoItem)
          Left _ -> notFound.text ("todo item not found " ++ id)
    getTodoItems : '{Route, Exception, Remote, Log} ()
    getTodoItems =
      do
        name = noCapture GET (s "todos")
        records =
          OrderedTable.toStream todoTable |> Stream.toList
        jsonRecords =
          Json.array (List.map (r -> at2 r |> toJson) records)
        info.json "records" jsonRecords
        ok.json jsonRecords
    putTodoItem : '{Route, Exception, Remote} ()
    putTodoItem =
      do
        name = noCapture PUT (s "todo")
        todoItem : {Route, Exception} TodoItem
        todoItem = decodeJson TodoItem.fromJson
        key = TodoItem.id todoItem
        match catch do
          randomly do BTree.write todoTable key todoItem with
          Left e ->
            badRequest.text
              ("failed to write todo item " ++ key)
          Right _ -> ok.text ("created todo item " ++ key)
    deleteTodoItem : '{Route, Exception, Remote} ()
    deleteTodoItem =
      do
        id = route DELETE (s "todo" / Parser.text)
        match catch do OrderedTable.delete todoTable id with
          Left _ ->
            badRequest.text
              ("todo item failed to be  found " ++ id)
          Right _ -> ok.text ("deleted todo item " ++ id)
    getTodoItem
      <|> putTodoItem
      <|> deleteTodoItem
      <|> getTodoItems
      <|> healthCheck
````
