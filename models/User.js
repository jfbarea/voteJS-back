'use strict';

// Dependencies

var db = require('../lib/database.js');

/**
 * Database model
 */
module.exports = db.model('User', {
	name                : String,
	password            : String,
});
