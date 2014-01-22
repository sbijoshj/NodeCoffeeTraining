# fifth coffee program - a module to handle split messages
events = require('events')

# client constructor
class exports.LDJClient extends events.EventEmitter
  constructor: (stream) ->
    super
    console.log "setting up LDJClient ctor - stream:"+stream
    buffer = ''
    stream.on 'data', (data) =>
      console.log "got data:"+data+" buffer before:"+buffer
      buffer += data
      boundary = buffer.indexOf('\n')
      console.log "buffer after adding data:"+buffer+" and boundary:"+boundary
      while( boundary != -1 )
        input = buffer.substr 0, boundary
        buffer = buffer.substr(boundary+1)
        console.log "emitting message:"+input
        debugger
        @on 'message', ->
          console.log "found message!", arguments
        @emit('message', JSON.parse(input))
        boundary = buffer.indexOf('\n')
      console.log "done trimming complete messages- buffer is now:"+buffer

