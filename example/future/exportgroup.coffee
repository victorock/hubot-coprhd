module.exports = (robot) ->
  exportgroup = (options) ->
    return robot.cli( "exportgroup  \"#{options}\"  \
                      -hostname \"#{hostname}\"     \
                      -tenant \"#{tenant}\"         \
                      -project \"#{project}\"       \
                      -varray \"#{varray}\"" )

  robot.commands.push "hubot coprhd list export-group"
  robot.respond /((list|ls) (exportgroup|export-group))(s|)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    msg.reply robot.exportgroup("list")

  robot.commands.push "hubot coprhd show export-group <name>"
  robot.respond /((show|sh) (exportgroup|export-group)) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    msg.reply robot.exportgroup(  "show \
                                  -name #{name}" )

  robot.commands.push "hubot coprhd new export-group <name>"
  robot.respond /((create|new) (exportgroup|export-group)) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...creating #{name}..."
    msg.reply robot.exportgroup(  "create       \
                                  -name #{name} \
                                  -sync" )

  robot.commands.push "hubot coprhd delete export-group <name>"
  robot.respond /((delete|remove) (exportgroup|export-group)) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...removing..."
    msg.reply robot.exportgroup(  "delete       \
                                  -name #{name} \
                                  -sync" )

  robot.commands.push "hubot coprhd delete export-group <name> add host <host>"
  robot.respond /((update|change) (exportgroup|export-group)) (.*) add host (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    host = msg.match[3].trim()
    msg.reply msg.random friendly "...updating..."
    msg.reply robot.exportgroup(  "add_host           \
                                  -name #{name}       \
                                  -hostlabel #{host}  \
                                  -sync" )

  robot.commands.push "hubot coprhd delete export-group <name> add cluster <host>"
  robot.respond /((update|change) (exportgroup|export-group)) (.*) add cluster (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    cluster = msg.match[3].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    msg.reply robot.exportgroup(  "add_cluster        \
                                  -name #{name}       \
                                  -cluster #{cluster} \
                                  -sync" )

robot.commands.push "hubot coprhd delete initiator <name> add volume <volume>"
robot.respond /((update|change) (exportgroup|export-group)) (.*) add volume (.*)$/i, (msg) ->
  name = msg.match[2].trim()
  volume = msg.match[3].trim()
  msg.reply msg.random friendly "...updating..."
  msg.reply robot.exportgroup(  "add_vol              \
                                -name #{name}         \
                                -volume #{volume}:-1  \
                                -sync" )
