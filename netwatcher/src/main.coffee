# second coffee program- basic socket server
fs = require('fs')
net = require('net')
#spawn = require('child_process').spawn
filename = process.argv[2]

if !filename
  throw "filename param missing!"


server = net.createServer (connection) ->
  
  # reporting
  console.log "subscriber connected... cwd:"+process.cwd()
  #connection.write "Now watching '"+filename+"' for changes...\n"
  connection.write JSON.stringify( 
    {
      type: 'watching',
      file: filename
    }
  ) + "\n"
  
  # watcher setup
  watcher = fs.watch filename, ->
    connection.write JSON.stringify(
      {
        type: 'changed',
        file: filename
        timestamp: Date.now()
      }
    ) + "\n"
  
  # cleanup
  connection.on 'close', ->
    console.log 'subscriber disconnected'
    watcher.close()


server.listen 5432, ->
  console.log 'Listening for subscribers...'


