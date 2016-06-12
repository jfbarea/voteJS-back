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
