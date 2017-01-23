module.exports = (robot) ->
  volume = (options) ->
    return robot.cli( "volume #{options}         \
                      -hostname \"#{hostname}\" \
                      -tenant \"#{tenant}\"     \
                      -project \"#{project}\"" )

  robot.commands.push "hubot coprhd find volume <name>"
  robot.respond /((find|search) volume) (.*)$/i, (msg) ->
    msg.reply msg.random friendly "Sorry, but this action is not implemented yet..."

  robot.commands.push "hubot coprhd list volume"
  robot.respond /((list|ls) volume)(s|)$/i, (msg) ->
    msg.reply msg.random friendly "...listing volume..."
    msg.reply robot.volume("list")

  robot.commands.push "hubot coprhd show volume <name>"
  robot.respond /((show|sh) volume) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...showing volume #{name}..."
    msg.reply robot.volume( "show \
                            -name \"#{name}\"" )

  robot.commands.push "hubot coprhd new volume of size <size[kKmMgGtT]>"
  robot.respond /((create|new) volume) of size (.*)$/i, (msg) ->
    name = robot.uniqueId(12)
    size = msg.match[2].trim()

    msg.reply msg.random friendly "...creating volume \"#{name}\"/\"#{size}\"..."
    msg.reply robot.volume( "create \
                            -name \"#{name}\" \
                            -size \"#{size}\" \
                            -vpool \"#{vpool}\" \
                            -varray \"#{size}\" \
                            -sync" )

  robot.commands.push "hubot coprhd new volume <name> size <size[kKmMgGtT]>"
  robot.respond /((create|new) volume) (.*) size (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    size = msg.match[3].trim()

    msg.reply msg.random friendly "...creating volume \"#{name}\" \"#{size}\"..."
    msg.reply robot.volume( "create \
                            -name \"#{name}\"   \
                            -size \"#{size}\"   \
                            -vpool \"#{vpool}\" \
                            -varray \"#{size}\" \
                            -sync" )

  robot.commands.push "hubot coprhd attach volume <name> to host <name>"
  robot.respond /((attach|present) volume) (.*) to host (.*)$/i, (msg) ->
    volume  = msg.match[2].trim()
    host    = msg.match[3].trim()

    msg.reply msg.random friendly "...creating exportgroup #{host}..."
    msg.reply robot.exportgroup(  "create       \
                                  -name #{host} \
                                  -sync" )

    msg.reply msg.random friendly "...adding host #{host} to exportgroup..."
    msg.reply robot.exportgroup(  "add_host           \
                                  -name #{host}       \
                                  -hostlabel #{host}  \
                                  -sync" )

    msg.reply msg.random friendly "...attaching volume #{volume} to exportgroup..."
    msg.reply robot.exportgroup(  "add_vol              \
                                  -name #{host}         \
                                  -volume #{volume}:-1  \
                                  -sync" )

  robot.commands.push "hubot coprhd attach volume <name> to cluster <name>"
  robot.respond /((attach|present) volume) (.*) to cluster (.*)$/i, (msg) ->
    volume  = msg.match[2].trim()
    cluster = msg.match[3].trim()


    msg.reply msg.random friendly "...creating exportgroup #{cluster}..."
    msg.reply robot.exportgroup(  "create       \
                                  -name #{cluster} \
                                  -sync" )

    msg.reply msg.random friendly "...adding cluster #{cluster} to exportgroup..."
    msg.reply robot.exportgroup(  "add_host           \
                                  -name #{cluster}       \
                                  -hostlabel #{cluster}  \
                                  -sync" )

    msg.reply msg.random friendly "...attaching volume #{volume} to exportgroup..."
    msg.reply robot.exportgroup(  "add_vol              \
                                  -name #{cluster}         \
                                  -volume #{volume}:-1  \
                                  -sync" )
