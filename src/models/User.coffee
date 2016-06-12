# Dependencies

db = require '../lib/database'

##
#  Database User model
##
module.exports = db.model 'User',
	name  : String,
	pass  : String,
	id    : String,
	role  : String,
