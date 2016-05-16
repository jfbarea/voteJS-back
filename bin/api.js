/*global __dirname*/
/*Requires */

var express = require('express');
var path = require('path');
var http = require('http');
var methodOverride = require('method-override');
var session = require('express-session');
var bodyParser = require('body-parser');
var errorHandler = require('errorhandler');

var routes = require('../routes/index.js');
var settings = require('../settings.js');

var log = require('../lib/log.js').Log(settings.LOG_LEVEL);
var app = express();

// Basic configuration
app.set('port', 3000);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(methodOverride());
app.use(session({ resave: true,
									saveUninitialized: true,
									secret: 'uwotm8' }));

// Static files
app.use(express.static(path.join(__dirname, '../../front/', settings.ROOT_FOLDER)));

routes.index.forEach((route) => {
	try {
		app[route.method](route.path, route.task);
	} catch (e) {
		log.warn(`Route from path ${route.path} missing`);
	}
});

if ('development' == app.get('env')) {
	app.use(errorHandler());
}

// Server creation

var server = http.createServer(app);
var port = app.get('port');
server.on('connection', (socket) => {socket.setTimeout(1000 * 60 * 60);});
server.listen(port, () => {
	log.info(`Running on port number: ${port}`);
});
