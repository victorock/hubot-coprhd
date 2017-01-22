module.exports = (robot) ->
  volume = (options) ->
    return robot.cli( "volume             \
                      -tenant #{tenant}   \
                      -project #{project} \
                      -varray #{varray}   \
                      #{options}" )

  robot.respond /(find|search) volume (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."

  robot.commands.push "hubot coprhd list volume"
  robot.respond /(list|ls) volume(s|)$/i, (msg) ->
    msg.reply msg.random friendly "...listing volume..."
    msg.reply robot.volume("list")

  robot.commands.push "hubot coprhd show volume <name>"
  robot.respond /(show|sh) volume (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...showing volume #{name}..."
    msg.reply robot.volume( "show \
                            -name #{name}" )

  robot.commands.push "hubot coprhd new volume of size <size[kKmMgGtT]>"
  robot.respond /(create|new) volume of size (.*)$/i, (msg) ->
    name = robot.uniqueId(12)
    size = msg.match[2].trim()

    msg.reply msg.random friendly "...creating volume #{name} #{size}..."
    msg.reply robot.volume( "create \
                            -name #{name} \
                            -size #{size}
                            -sync" )

  robot.commands.push "hubot coprhd new volume <name> size <size[kKmMgGtT]>"
  robot.respond /(create|new) volume (.*) size (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    size = msg.match[3].trim()

    msg.reply msg.random friendly "...creating volume #{name} #{size}..."
    msg.reply robot.volume( "create \
                            -name #{name} \
                            -size #{size}
                            -sync" )

  robot.respond /(attach|present) volume (.*) to host (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")
