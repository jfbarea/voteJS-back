'use strict';

# Dependencies

mongoose = require  'mongoose'
settings = require  '../settings'

# Database connection

console.log "Connecting Mongoose to '#{settings.MONGO_URI}'..."

db = mongoose.connect(settings.MONGO_URI).connection

db.on 'error', (error) -> console.log "Cannot connect Mongoose. Error: #{error}"


db.once 'open', -> console.log 'Database ready!'

# Exports

module.exports = mongoose
