module.exports = (robot) ->
  initiator = (options) ->
    return robot.cli( "initiator \"#{options}\" \
                      -tenant \"#{tenant}\"     \
                      -project \"#{project}\"" )

  robot.commands.push "hubot coprhd find initiator <name>"
  robot.respond /(find|search) initiator (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd list initiator"
  robot.respond /((list|ls) (initiator))(s|)$/i, (msg) ->
    msg.reply msg.random friendly "...listing Initiators on Tenant: #{tenant}, Project: #{project}, Array: #{varray}..."
    msg.reply robot.initiator("list")

  robot.commands.push "hubot coprhd show initiator <name>"
  robot.respond /((show|sh) (initiator)) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...showing #{name}..."
    msg.reply robot.initiator(  "show \
                                -name \"#{name}\"" )

  robot.commands.push "hubot coprhd new initiator <name> wwn <wwn> pwwn <pwwn> - FC Hosts"
  robot.respond /(create|new) (initiator)) (.*) wwn (.*) wwpn (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    wwn = msg.match[3].trim()
    pwwn = msg.match[4].trim()
    msg.reply msg.random friendly "...creating #{name}..."
    msg.reply robot.initiator(  "create                 \
                                -hostlabel \"#{name}\"  \
                                -wwn \"#{wwn}\"         \
                                -pwwn \"#{pwwn}\"       \
                                -type fc                \
                                -sync" )

  robot.commands.push "hubot coprhd new initiator <name> iqn <iqn> - iSCSI Hosts"
  robot.respond /(create|new) (initiator)) (.*) wwpn (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    iqn = msg.match[3].trim()
    msg.reply msg.random friendly "...creating #{name}..."
    msg.reply robot.initiator(  "create       \
                                -hostlabel \"#{name}\" \
                                -pwwn \"#{iqn}\" \
                                -type iscsi \
                                -sync" )

  robot.commands.push "hubot coprhd delete initiator <name>"
  robot.respond /(delete|remove) (initiator)) (.*)$/i, (msg) ->
    name = msg.match[2].trim()
    msg.reply msg.random friendly "...action not implemented yet..."
    msg.reply robot.initiator(  "delete       \
                                -name \"#{name}\" \
                                -sync" )
