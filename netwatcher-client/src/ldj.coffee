# fifth coffee program - a module to handle split messages
events = require('events')
util = require('util')

# client constructor
LDJClient = (stream) ->
  events.EventEmitter.call(this)
  console.log "setting up LDJClient ctor - stream:"+stream
  self = this
  buffer = ''
  stream.on 'data', (data) ->
    console.log "got data:"+data+" buffer before:"+buffer
    buffer += data
    boundary = buffer.indexOf('\n')
    console.log "buffer after adding data:"+buffer+" and boundary:"+boundary
    while( boundary != -1 )
      input = buffer.substr 0, boundary
      buffer = buffer.substr(boundary+1)
      console.log "emitting message:"+input
      debugger
      self.on 'message', ->
        console.log "found message!", arguments
      self.emit('message', JSON.parse(input))
      boundary = buffer.indexOf('\n')
    console.log "done trimming complete messages- buffer is now:"+buffer
  return this

util.inherits LDJClient, events.EventEmitter

# expose module methods
exports.LDJClient = LDJClient
exports.connect = (stream) ->
  new LDJClient(stream)

