module.exports = (robot) ->
  order = (options) ->
    return robot.cli( "order              \
                      -tenant #{tenant}   \
                      -project #{project} \
                      -varray #{varray}   \
                      #{options}" )
  
    robot.commands.push "hubot coprhd show order <uri>"
    robot.respond /((list|ls) order(s|))$/i, (msg) ->
      msg.reply msg.random friendly "...listing orders..."
      msg.reply robot.volume( "list" )

    robot.commands.push "hubot coprhd show order <uri>"
    robot.respond /(show|sh) order (.*)$/i, (msg) ->
      order = msg.match[2].trim()
      msg.reply msg.random friendly "...showing order #{uri}..."
      msg.reply robot.volume( "show \
                               -uri #{uri}" )