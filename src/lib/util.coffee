crypto = require 'crypto'

exports.generateRandomID =  ->
  current_date = (new Date()).valueOf().toString()
  random = Math.random().toString()
  crypto.createHash('sha1').update(current_date + random).digest('hex')
exports.filterResponse = (response, filter) ->
  result = {}
  (result?[field] = response[field]) for field in filter
  return result
