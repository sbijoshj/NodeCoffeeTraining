# second coffee program- basic socket server
fs = require('fs')
net = require('net')
#spawn = require('child_process').spawn
filename = process.argv[2]

if !filename
  throw "filename param missing!"


console.log "now:"+new Date()
console.log "now:"+Date.now()
console.log "now:"+new Date().toUTCString()
console.log "now:"+new Date().toString()


server = net.createServer (connection) ->
  
  # reporting
  console.log "subscriber connected... cwd:"+process.cwd()
  connection.write "Now watching '"+filename+"' for changes...\n"
  
  # watcher setup
  watcher = fs.watch filename, ->
    connection.write "File '"+filename+"' changed:"+new Date()+"\n"
  
  # cleanup
  connection.on 'close', ->
    console.log 'subscriber disconnected'
    watcher.close()


server.listen 5432, ->
  console.log 'Listening for subscribers...'


