module.exports = (robot) ->
  robot.commands.push "hubot coprhd find fileshare <name>"
  robot.respond /(find|search) fileshare (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd list fileshare"
  robot.respond /(list|ls) fileshare$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd show fileshare <name>"
  robot.respond /(show|sh) fileshare (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd new fileshare <name>"
  robot.respond /(create|new) fileshare (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd new fileshare <name> and export to <host>"
  robot.respond /(create|new) fileshare (.*) and export to (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd export fileshare <name> to <host>"
  robot.respond /(export|present) fileshare (.*) to (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
