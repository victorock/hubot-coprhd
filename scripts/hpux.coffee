module.exports = (robot) ->
  robot.commands.push "hubot coprhd new hpux filesystem <name> on <host>"
  robot.respond /(create|new) hpux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd delete hpux filesystem <name> on <host>"
  robot.respond /(delete|remove) hpux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd mount hpux filesystem <name> on <host>"
  robot.respond /(mount|format) hpux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd unmount hpux filesystem <name> on <host>"
  robot.respond /(unmount) hpux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
