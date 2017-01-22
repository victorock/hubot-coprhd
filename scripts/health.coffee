module.exports = (robot) ->

  robot.commands.push "hubot coprhd show health <name>"
  robot.respond /(show|sh) health (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd what's up?"
  robot.respond /what's up/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
