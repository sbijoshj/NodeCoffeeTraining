# first coffee program- watch a file to see if it changes
fs = require('fs')
#spawn = require('child_process').spawn
#filename = process.argv[2]

#if !filename
#  throw Error "filename param missing!"

console.log process.cwd()

#fs.exists 'target.txt', (e) ->
#  console.log "exists: " + e

fs.watch 'target.txt', (e, f) ->
  console.log "target changed!"

#fs.watch filename, (e, f) ->
#  ls = spawn('ls', ['-lh', filename]);
##  ls.stdout.pipe(process.stdout)
#  ls.stdout.on 'data', (chunk) ->

#fs.appendFile 'target.txt', "new line to add", (e) ->
##  throw e if e
#  console.log 'data appnd'

console.log "watching target..."

