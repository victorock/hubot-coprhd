module.exports = (robot) ->
  system = (options) ->
    return robot.cli( "system \"#{options}\"    \
                      -hostname \"#{hostname}\"" )

  robot.commands.push "hubot coprhd show system health"
  robot.commands.push "hubot coprhd what's up?"
  robot.respond /what's up/i, (msg) ->
  robot.respond /(show|sh) system health$/i, (msg) ->
    msg.reply msg.random friendly "...showing health..."
    msg.reply robot.system( "show \
                            get-health" )

  robot.commands.push "hubot coprhd show system storage"
  robot.commands.push "hubot coprhd what's your capacity?"
  robot.respond /what's your capacity/i, (msg) ->
  robot.respond /(show|sh) system storage$/i, (msg) ->
    msg.reply msg.random friendly "...Hmm let me check..."
    msg.reply robot.system( "show \
                            get-storage" )
