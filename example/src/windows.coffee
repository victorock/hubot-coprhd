module.exports = (robot) ->
  robot.respond /(create|new) windows filesystem (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(mount|format) windows filesystem$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
