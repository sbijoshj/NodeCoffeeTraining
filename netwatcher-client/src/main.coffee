# third coffee program- basic socket client
net = require('net')
ldj = require('./ldj')

netClient = net.connect({port:5432})
ldjClient = new ldj.LDJClient(netClient)

#spawn = require('child_process').spawn
console.log "connected to ldj server ldjClient:", ldjClient
debugger
ldjClient.on 'message', (message) ->
  console.log "got message:"+message
  if message.type == 'watching'
    console.log "Now watching file:"+message.file
  else if message.type == 'changed'
    date = new Date(message.timestamp)
    console.log "File '"+message.file+"' changed at "+date
  else
    throw "Unrecognized message type:"+message.type


