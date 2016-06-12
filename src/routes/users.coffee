users = require '../tasks/users'
exports.create = (req, res) ->
	users.create req.body
	.then (data) ->
		res.status(201).send data
	.catch (error) ->
		res.sendStatus(500).send error

exports.remove = (req, res) ->
	users.remove req.params.id
	.then (data) ->
		res.send data
	.catch (error) ->
		res.sendStatus(500).send error
