module.exports = (robot) ->
  robot.commands.push "hubot coprhd new linux filesystem <name> of <volume> on <host> at <mount point>"
  robot.respond /(create|new) linux filesystem (.*) on (.*) at (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd remove linux filesystem <name> on <host>"
  robot.respond /(delete|remove) linux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd format linux filesystem <name> on <host> at <mount point>"
  robot.respond /(mount|format) linux filesystem (.*) on (.*) at (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd format linux filesystem <name> on <host>"
  robot.respond /(unmount) linux filesystem (.*) on (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
