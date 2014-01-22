# fourth coffee program- test service
#fs = require('fs')
net = require('net')
#spawn = require('child_process').spawn

server = net.createServer (connection) ->
  
  console.log "creating server and sending first half with connection:"+connection
  # send the first chunk immediately
  connection.write '{"type":"changed","file":"targ'
  
  # after one second, send the rest
  timer = setTimeout ->
    console.log "writing the second half"
    connection.write 'et.txt","timestamp":1358175758495}' + "\n"
    connection.end()
  , 1000
  
  # clear timer when connection ends
  connection.on 'end', ->
    clearTimeout timer
    console.log 'Subscriber disconnected'


server.listen 5432, ->
  console.log 'TEST Listening for subscribers...'


