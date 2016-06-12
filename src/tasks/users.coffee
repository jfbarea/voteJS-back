User = require '../models/User'
util = require '../lib/util'

exports.create = (attrs)->
	return new Promise (resolve, reject) ->
		attrs.creationDate = attrs.lastUpdate = new Date()
		attrs.id = util.generateRandomID()
		user = new User(attrs)
		user.save (error, user) ->
			if error
				console.log "Cannot create user '#{user.name}'. #{error}"
				reject error
			console.log "Scenario #{user.name} created"
			console.log 'USER', user
			resolve user

exports.remove = (id)->
	return new Promise (resolve, reject) ->
		User
			.find {id: id}
			.remove()
			.exec (error) ->
				if error
					console.log "Cannot delete user '#{id}'. #{error}"
					reject error
				console.log "User #{id} deleted"
				resolve()
