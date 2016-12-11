request = require 'supertest'
settings = require '../settings'
require 'mocha'
require 'should'
require 'winston'
require 'assert'

SERVER = "http://localhost:#{settings.PORT}"
testName = 'Charlie'
describe 'General Management --', ->
  it 'Testing api', (done) ->
    request SERVER
    .get "/api/hello/#{testName}"
    .expect 200
    .end (error, response) ->
      throw error if error
      console.log response.body
      response.body.should.be.equal("hello #{testName}")
      done()
