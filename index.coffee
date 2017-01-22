# Description
#   A hubot script to interact with Storage Infrastructure.
#
# Configuration:
#   HUBOT_COPRHD_APIURL
#   HUBOT_COPRHD_TOKEN
#   HUBOT_COPRHD_TENANT
#   HUBOT_COPRHD_VARRAY
#   HUBOT_COPRHD_PROJECT
#
# Commands:
#   hubot help coprhd
#
# Author:
#   victorockeiro@gmail.com

fs   = require 'fs'
path = require 'path'

apiUrl = process.env.HUBOT_COPRHD_URL
unless apiUrl?
  console.log "Missing HUBOT_COPRHD_APIURL environment variable"
  process.exit(1)

username = process.env.HUBOT_COPRHD_USERNAME
unless username?
  console.log "Missing HUBOT_COPRHD_USERNAME environment variable"
  process.exit(1)

password = process.env.HUBOT_COPRHD_PASSWORD
unless password?
  console.log "Missing HUBOT_COPRHD_PASSWORD environment variable"
  process.exit(1)

tenant = process.env.HUBOT_COPRHD_TENANT
unless tenant?
  console.log "Missing HUBOT_COPRHD_TENANT environment variable"
  process.exit(1)

varray = process.env.HUBOT_COPRHD_VARRAY
unless varray?
  console.log "Missing HUBOT_COPRHD_VARRAY environment variable"
  process.exit(1)

project = process.env.HUBOT_COPRHD_PROJECT
unless project?
  console.log "Missing HUBOT_COPRHD_PROJECT environment variable"
  process.exit(1)

module.exports = (robot) ->
  scripts_path = path.resolve __dirname, 'scripts'
  if fs.existsSync scripts_path
    for category_file in fs.readdirSync(scripts_path)
      category_path = path.resolve scripts_path, category_file
      if fs.existsSync category_path
        robot.loadFile category_path, file for file in fs.readdirSync(category_path)
