request = require 'supertest'
settings = require '../settings'
constants = require '../constants'
require 'mocha'
require 'should'
require 'winston'
require 'assert'
attrs =
  name: "name-#{Math.floor Math.random() * 10000}"
  pass: "type-#{Math.floor Math.random() * 10000}"
  role: 'admin'
SERVER = "http://localhost:#{settings.PORT}"

describe 'Users Management --', ->
  this.timeout 60 * 5 * 1000
  userID = ''
  it 'Creating user', (done) ->
    request SERVER
    .post '/api/user'
    .send attrs
    .expect 201
    .end (error, response) ->
      throw error if error
      constants.userAttrs.forEach((attr) ->
        response.body.should.have.property(attr))
      userID = response.body.id
      done()
  it 'Getting user', (done) ->
    request SERVER
    .get "/api/user/#{userID}"
    .expect 200
    .end (error, response) ->
      throw error if error
      constants.userAttrs.forEach((attr) ->
        response.body.should.have.property(attr))
      done()
  it 'Deleting user', (done) ->
    request SERVER
    .delete "/api/user/#{userID}"
    .expect 200
    .end (error, response) ->
      throw error if error
      done()
