module.exports = (robot) ->
  robot.commands.push "hubot coprhd find snapshot <name>"
  robot.respond /(find|search) snapshot (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd list snapshot "
  robot.respond /(list|ls) snapshot$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd show snapshot <name>"
  robot.respond /(show|sh) snapshot (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd new snapshot <name>"
  robot.respond /(create|new) snapshot (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd attach snapshot <name> to <host>"
  robot.respond /(attach|present) snapshot (.*) to (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
