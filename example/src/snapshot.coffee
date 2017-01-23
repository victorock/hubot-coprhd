module.exports = (robot) ->
  volume = (options) ->
    return robot.cli( "snapshot \"#{options}\"  \
                      -hostname \"#{hostname}\" \
                      -tenant \"#{tenant}\"     \
                      -project \"#{project}\"" )

  robot.commands.push "hubot coprhd find snapshot <name>"
  robot.respond /((find|search) snapshot) (.*)$/i, (msg) ->
    msg.reply msg.random friendly "Sorry, but this action is not implemented yet..."

  robot.commands.push "hubot coprhd list snapshot of volume <name>"
  robot.respond /((list|ls) snapshot) of volume (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...listing snapshot of \"#{name}\"..."
    msg.reply robot.volume("list \
                          -volume \"#{volume}\"")

  robot.commands.push "hubot coprhd list snapshot of filesystem <name>"
  robot.respond /((list|ls) snapshot) of filesystem (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...listing snapshot of \"#{name}\"..."
    msg.reply robot.volume("list \
                          -filesystem \"#{volume}\"")

  robot.commands.push "hubot coprhd show snapshot <name> of volume <name>"
  robot.respond /((show|sh) snapshot) (.*) of volume (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    volume = msg.match[3].trim()
    msg.reply msg.random friendly "...showing snapshot \"#{name}\"..."
    msg.reply robot.volume( "show               \
                            -name \"#{name}\"   \
                            -volume \"#{volume}\"" )

  robot.commands.push "hubot coprhd show snapshot <name> of filesystem <name>"
  robot.respond /((show|sh) snapshot) (.*) of filesystem (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    volume = msg.match[3].trim()
    msg.reply msg.random friendly "...showing snapshot \"#{name}\"..."
    msg.reply robot.volume( "show               \
                            -name \"#{name}\"   \
                            -volume \"#{volume}\"" )


  robot.commands.push "hubot coprhd new snapshot of volume <name> - Random Snapshot Name"
  robot.respond /((create|new) snapshot) of volume (.*)$/i, (msg) ->
    name = robot.uniqueId(12)
    volume = msg.match[2].trim()

    msg.reply msg.random friendly "...creating snapshot \"#{name}\" of volume \"#{volume}\"..."
    msg.reply robot.volume( "create           \
                            -name \"#{name}\" \
                            -volume \"#{volume}\"
                            -sync" )

  robot.commands.push "hubot coprhd new snapshot of filesystem <name> - Random Snapshot Name"
  robot.respond /((create|new) snapshot) of filesystem (.*)$/i, (msg) ->
    name = robot.uniqueId(12)
    filesystem = msg.match[2].trim()

    msg.reply msg.random friendly "...creating snapshot \"#{name}\"..."
    msg.reply robot.volume( "create           \
                            -name \"#{name}\" \
                            -filesystem \"#{filesystem}\"
                            -sync" )

  robot.commands.push "hubot coprhd attach snapshot <name> of volume <name> to host <name>"
  robot.respond /((attach|present) snapshot) (.*) to host (.*)$/i, (msg) ->
    snapshot  = msg.match[2].trim()
    volume  = msg.match[3].trim()
    host    = msg.match[4].trim()

    msg.reply msg.random friendly "...creating exportgroup \"#{host}\"..."
    msg.reply robot.exportgroup(  "create           \
                                  -name \"#{host}\" \
                                  -sync" )

    msg.reply msg.random friendly "...adding host \"#{host}\" to exportgroup..."
    msg.reply robot.exportgroup(  "add_host               \
                                  -name \"#{host}\"       \
                                  -hostlabel \"#{host}\"  \
                                  -sync" )

    msg.reply msg.random friendly "...attaching volume #{volume} to exportgroup..."
    msg.reply robot.exportgroup(  "add_vol                  \
                                  -name \"#{host}\"             \
                                  -volume \"#{volume}\"         \
                                  -snapshot \"#{snapshot}:-1\"  \
                                  -sync" )
