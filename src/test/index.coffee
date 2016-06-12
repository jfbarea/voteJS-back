request = require 'supertest'
settings = require '../settings'
require 'mocha'
require 'should'
require 'winston'
require 'assert'

SERVER = "http://localhost:#{settings.PORT}"

describe 'General Management --', ->
	it 'Testing api', (done) ->
		request SERVER
			.get '/api/hello'
			.expect 200
			.end (error, response) ->
				if error
					throw error
				console.log 'RESPONSE', response.body
				done()

describe 'Users Management --', ->
	userID = ''
	it 'Creating user', (done) ->
		attrs =
			name: "name-#{Math.floor Math.random() * 10000}"
			pass: "type-#{Math.floor Math.random() * 10000}"
			role: 'admin'
		request SERVER
			.post '/api/user'
			.send attrs
			.expect 201
			.end (error, response) ->
				if error
					throw error
				console.log 'RESPONSE', response.body
				userID = response.body.id
				done()

	it 'Deleting user', (done) ->
		request SERVER
			.delete "/api/user/#{userID}"
			.expect 200
			.end (error, response) ->
				if error
					throw error
				console.log 'RESPONSE', response.body
				done()
