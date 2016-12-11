user = require '../tasks/user'
util = require '../lib/util'
constants = require '../constants'

exports.create = (req, res) ->
  user.create req.body
  .then (data) -> res.send 201, util.filterResponse data, constants.userAttrs
  .catch (error) -> res.send 500, error

exports.get = (req, res) ->
  user.get req.params.id
  .then (data) -> res.send 200, util.filterResponse data, constants.userAttrs
  .catch (error) -> res.send 500, error

exports.remove = (req, res) ->
  user.remove req.params.id
  .then (data) -> res.send 200, data
  .catch (error) -> res.send 500, error
