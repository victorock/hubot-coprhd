module.exports = (robot) ->
  robot.commands.push "hubot coprhd new aix filesystem <name> of size <size>"
  robot.respond /(create|new) aix filesystem (.*) of size (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd remove aix filesystem <name> on <host>"
  robot.respond /(delete|remove) aix filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd format aix filesystem <name> on <host>"
  robot.respond /(mount|format) aix filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd format aix filesystem <name> on <host>"
  robot.respond /(unmount) aix filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
