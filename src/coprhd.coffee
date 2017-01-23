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

if !(fs.existsSync coprhd_bin) && !(process.env.HUBOT_COPRHD_DEV)
  console.log "Missing #{coprhd_bin} file"
  console.log "Confirm if the package is installed properly"
  process.exit(1)

## Function: Wrapper for the Command-line
coprhdCli = (options) ->
  exec = require('child_process').exec
  exec ("#{coprhd_bin} #{options}"), (error, stdout, stderr) ->
    console.error "coprhd: #{error}"  if error
    console.error "coprhd: #{stderr}" if stderr
    console.log   "coprhd: #{stdout}" if stdout

    return [ error, stdout, stderr ]

## Function: Check if user can access
canAccess = (robot, user) ->
  return true if process.env.HUBOT_COPRHD_DEV

  if robot.auth.isAdmin(user)
    return true

  role = process.env.HUBOT_COPRHD_ROLE
  if role && robot.auth.hasRole(user, role)
    return true
  else
    return false

module.exports = (robot) ->
  robot.commands.push "hubot coprhd cli exec <command>"
  robot.respond /((client|cli) exec) (.*)$/i, (msg) ->
    unless canAccess(robot, msg.envelope.user)
      msg.reply "You cannot access this feature. Please contact an admin."
      return

    args = msg.match[2].trim()

    msg.reply "executing..."

    [ error, stdout, stderr ] = coprhdCli( "#{command}" )

    msg.reply "Error: #{error}" if error
    msg.reply "Stderr: #{stderr}" if stderr
    msg.reply "#{stdout}" if stdout
    msg.reply "Done :)"
