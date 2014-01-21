# first coffee program- watch a file to see if it changes
fs = require('fs')
spawn = require('child_process').spawn
filename = process.argv[2]
[command, params...] = process.argv.slice(3)
#d = new Date()

if !filename
  throw "filename param missing!"

console.log process.cwd()

#fs.exists 'target.txt', (e) ->
#  console.log "exists: " + e

#fs.watch 'target.txt', (e, f) ->
#  console.log "target changed! ms:"+(new Date - d)

console.log("params:"+params);

fs.watch filename, (e, f) ->
  ls = spawn(command, params);
  output = ""
#  ls.stdout.pipe(process.stdout)
  ls.stdout.on 'data', (chunk) ->
    output += chunk.toString()
  
  ls.on 'close', ->
    console.log output
    parts = output.split /\s+/
    console.log parts
    console.dir [parts[0], parts[4], parts[8]]


#fs.appendFile 'target.txt', "new line to add", (e) ->
#  throw e if e
#  console.log "data appnd ms:"+(new Date - d)

console.log "watching target..."

