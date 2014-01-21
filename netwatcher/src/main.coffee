# second coffee program- basic socket server
fs = require('fs')
net = require('net')
#spawn = require('child_process').spawn
filename = process.argv[2]

if !filename
  throw "filename param missing!"


console.log "obj:"+{test0:val1}
console.log( { test1a: "val1", 
test1b: 'val2' } )
console.log(
  {
    test1a:'val1',
    test1b:'val2'
  }
)
console.log "end"


server = net.createServer (connection) ->
  
  # reporting
  console.log "subscriber connected... cwd:"+process.cwd()
  connection.write "Now watching '"+filename+"' for changes...\n"
  #connection.write JSON.stringify 
  
  # watcher setup
  watcher = fs.watch filename, ->
    connection.write "File '"+filename+"' changed:"+new Date()+"\n"
  
  # cleanup
  connection.on 'close', ->
    console.log 'subscriber disconnected'
    watcher.close()


server.listen 5432, ->
  console.log 'Listening for subscribers...'


