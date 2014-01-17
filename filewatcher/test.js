var exec = require('child_process').exec;

exec('node --harmony js/main.js', //function(err, stdout, stderr) {
//    if (err) {
//      throw err;
//    }
//    return console.log(stdout + stderr);
function (error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);
    if (error !== null) {
      console.log('exec error: ' + error);
    }
  });

