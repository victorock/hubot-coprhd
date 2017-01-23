module.exports = (robot) ->
  robot.respond /(set|use) project (.*)$/i, (msg) ->
    project = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(list|ls) project$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(show|sh) project (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
