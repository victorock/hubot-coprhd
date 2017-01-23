# Description
#   A hubot script to interact with Storage Infrastructure.
#
# Configuration:
#   HUBOT_COPRHD_DEV - DEV Mode, no authentication required.
#   HUBOT_COPRHD_ROLE - Role to access CoprHD (using hubot-auth)
#
# Commands
#   hubot coprhd cli exec --help
#
# Author:
#   victorockeiro@gmail.com

fs   = require 'fs'
coprhd_bin = "/opt/storageos/bin/cli/viprcli"
unless fs.existsSync coprhd_bin && process.env.HUBOT_COPRHD_DEV
  console.log "Missing #{coprhd_bin} file"
  console.log "Confirm if the package is installed properly"
  process.exit(1)

coprhdCli = (options) ->
  @exec = require('child_process').exec
  @exec ("#{coprhd_bin} #{options}"), (error, stdout, stderr) ->
    return { error: error, stdout: stdout, stderr: stderr }

module.exports = (robot) ->
  robot.commands.push "hubot coprhd cli exec <command>"
  robot.respond /((client|cli) exec)(.*)$/i, (msg) ->
    unless require('../../auth.coffee').canAccess(robot, msg.envelope.user)
      msg.send "You cannot access this feature. Please contact an admin."
      return

    args = msg.match[2].trim()

    msg.reply msg.random friendly "...executing..."
    msg.reply coprhdCli( "#{command}" )
