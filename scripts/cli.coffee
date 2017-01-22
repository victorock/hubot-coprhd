fs   = require 'fs'
coprhdbin = "/opt/storageos/bin/viprcli"
unless fs.existsSync coprhdbin
  console.log "Missing #{coprhdbin} file"
  console.log "Confirm if the package is installed properly"
  #process.exit(1)

module.exports = (robot) ->
  cli = (options) ->
    command = coprhdbin
    command += " "
    command += options

    @exec = require('child_process').exec
    @exec command, (error, stdout, stderr) ->
      return {  error: error
                stdout: stdout
                stderr: stderr
              }
