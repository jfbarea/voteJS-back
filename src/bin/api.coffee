express = require 'express'
http = require 'http'
methodOverride = require 'method-override'
bodyParser = require 'body-parser'
errorHandler = require 'errorhandler'
routes = require '../routes/index'

# log = require('../lib/log.js').Log(settings.LOG_LEVEL);
app = express()

 # Basic configuration
app.set 'port', 3000
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true
app.use methodOverride()

# Static files
#app.use express.static path.join __dirname, '../../front'

app.get '/api/hello', (req, res) -> res.send attr: 'HEY!'
routes.forEach (route) ->
	try
		app[route.method](route.path, route.task)
	catch
		console.log "Route from path #{route.path} missing"

# Server creation

server = http.createServer app
port = app.get 'port'
server.on 'connection', (socket) -> socket.setTimeout(1000 * 60 * 60)
server.listen port, -> console.log "Running on port number: #{port}"
