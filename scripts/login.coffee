module.exports = (robot) ->
  login = (username, password) ->
    return robot.cli( "authenticate         \
                      -hostname #{apiUrl}   \
                      -username #{username} \
                      -d \"/tmp\"           \
                      -p #{password}" )

  robot.commands.push "hubot coprhd authenticate"
  robot.respond /(login|authenticate)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd set token <token>"
  robot.respond /(set|use) token (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd login username <username> password <password>"
  robot.respond /(login|authenticate) username (.*) password (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
