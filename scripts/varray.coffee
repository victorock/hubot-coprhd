module.exports = (robot) ->
  robot.respond /(set|configure|use) varray (.*)$/i, (msg) ->
    varray = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(list|ls) varray$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.respond /(show|sh) varray (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
