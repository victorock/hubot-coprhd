module.exports = (robot) ->
  robot.commands.push "hubot coprhd <find|search> cluster <name>"
  robot.respond /(find|search) cluster (.*)$/i, (msg) ->
    findHost = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd <list|ls> cluster"
  robot.respond /(list|ls) cluster$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd <show|sh> cluster"
  robot.respond /(show|sh) cluster (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd create cluster <name> and add the following hosts <host,host,host>"
  robot.respond /(create|new) cluster with name (.*) and add the following hosts (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd update cluster <name> and add the following hosts <host,host,host>"
  robot.respond /(update|change) cluster with name (.*) and add the following hosts (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
