'use strict';

// Dependencies

var mongoose = require('mongoose');
var settings = require('../settings.js');
var log = require('./log.js').Log(settings.LOG_LEVEL);

// Database connection

log.info(`Connecting Mongoose to "${settings.MONGO_URI}"...`);

var db = mongoose.connect(settings.MONGO_URI).connection;

db.on('error', function(error) {
	log.error(`Cannot connect Mongoose. Error: ${error}`);
});
db.once('open', function () {
	log.info('Mongoose connection stablished successfully. Database ready!');
});

// Exports

module.exports = mongoose;
