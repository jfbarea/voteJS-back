settings = require '../settings'
util = require '../lib/util'
constants = require '../constants'
require 'mocha'
require 'should'
require 'winston'
require 'assert'
testResponse =
  name: "name-#{Math.floor Math.random() * 10000}"
  pass: "type-#{Math.floor Math.random() * 10000}"
  role: 'admin'
  id  : 'blabla'

describe 'Utils Management --', ->
  this.timeout 60 * 5 * 1000
  it 'Filter User', (done) ->
    result = util.filterResponse testResponse, constants.userAttrs
    console.log(result)
    result.should.have.property 'name'
    result.should.have.property 'id'
    result.should.have.property 'role'
    result.should.not.have.property 'pass'
    done()
