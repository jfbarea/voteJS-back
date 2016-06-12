constants   = require '../constants'
users       = require './users'

module.exports = [
		path   : '/api/user',
		task   : users.create,
		method : constants.POST
	,
		path   : '/api/user/:id',
		task   : users.remove,
		method : constants.DELETE
]
