# third coffee program- basic socket client
net = require('net')
client = net.connect({port:5432})
#spawn = require('child_process').spawn

client.on 'data', (data) ->
  message = JSON.parse(data)
  if message.type == 'watching'
    console.log "Now watching file:"+message.file
  else if message.type == 'changed'
    date = new Date(message.timestamp)
    console.log "File '"+message.file+"' changed at "+date
  else
    throw "Unrecognized message type:"+message.type


