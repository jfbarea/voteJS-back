routes   = require '../routes/index'
settings = require '../settings'
restify  = require 'restify'


server = restify.createServer()
server.use restify.bodyParser {}
server.get('/api/hello/:name', (req, res, next) ->
  res.send 'hello ' + req.params.name
  next()
)

server.listen(settings.PORT, () ->
  console.log("Server listening at #{settings.PORT}")
)

routes.forEach (route) ->
  try
    server[route.method](route.path, route.task)
  catch
    console.log "Route from path #{route.path} missing"
