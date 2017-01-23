module.exports = (robot) ->
  robot.respond /(set|use) tenant (.*)$/i, (msg) ->
    tenant = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(list|ls) tenant$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(show|sh) tenant (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
