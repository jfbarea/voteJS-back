constants   = require '../constants'
user       = require './user'

module.exports = [
		path   : '/api/user',
		task   : user.create,
		method : constants.POST
	,
		path   : '/api/user/:id',
		task   : user.get,
		method : constants.GET
	,
		path   : '/api/user/:id',
		task   : user.remove,
		method : constants.DELETE
]
