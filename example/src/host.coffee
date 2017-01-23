module.exports = (robot) ->
  initiator = (options) ->
    return robot.cli( "host               \
                      -tenant #{tenant}   \
                      -project #{project} \
                      -varray #{varray}   \
                      #{options}" )

  robot.commands.push "hubot coprhd find host <name>"
  robot.respond /((find|search) host) (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.host(  "find" )

  robot.commands.push "hubot coprhd list host"
  robot.respond /((list|ls) host)$/i, (msg) ->
  msg.reply msg.random friendly "...listing hosts on Tenant: #{tenant}, Project: #{project}, Array: #{varray}..."
  msg.reply robot.host(  "list" )

  robot.commands.push "hubot coprhd show host <name>"
  robot.respond /((show|sh) host) (.*)$/i, (msg) ->
    host = msg.match[2].trim()
    msg.reply msg.random friendly "...showing #{name}..."
    msg.reply robot.host(  "show \
                            -name #{name}" )

  robot.commands.push "hubot coprhd create host <name> os [Windows,HPUX,Linux,Esx,Other,AIXVIO,AIX,No_OS,SUN-VCS] username <username> password <password>"
  robot.respond /((create|new) host) (.*) os (.*) username (.*) password (.*)$/i, (msg) ->
    name      = msg.match[2].trim()
    type      = msg.match[3].trim()
    username  = msg.match[4].trim()
    password  = msg.match[5].trim()
    msg.reply msg.random friendly "...creating host and discoverying initiators..."
    msg.reply robot.host(  "create              \
                            -hostname #{name}   \
                            -hostlabel #{name}  \
                            -un #{username}     \
                            -type #{type}       \
                            -hostssl true       \
                            -discover true" )

  robot.commands.push "hubot coprhd create host <name> os [Esx] username <username> password <password> vcenter <name> datacenter <name>"
  robot.respond /((create|new) host) (.*) os (.*) username (.*) password (.*)$/i, (msg) ->
    name        = msg.match[2].trim()
    type        = msg.match[3].trim()
    username    = msg.match[4].trim()
    password    = msg.match[5].trim()
    vcenter     = msg.match[6].trim()
    datacenter  = msg.match[7].trim()
    msg.reply msg.random friendly "...creating host and discoverying initiators..."
    msg.reply robot.host(  "create                    \
                            -hostname #{name}         \
                            -hostlabel #{name}        \
                            -un #{username}           \
                            -type #{type}             \
                            -hostssl true             \
                            -vcenter #{vcenter}       \
                            -datacenter #{datacenter} \
                            -discover true" )

  robot.commands.push "hubot coprhd create host <name> os [Esx] username <username> password <password> vcenter <name> datacenter <name> cluster <name>"
  robot.respond /((create|new) host) (.*) os (.*) username (.*) password (.*)$/i, (msg) ->
    name        = msg.match[2].trim()
    type        = msg.match[3].trim()
    username    = msg.match[4].trim()
    password    = msg.match[5].trim()
    vcenter     = msg.match[6].trim()
    datacenter  = msg.match[7].trim()
    cluster     = msg.match[8].trim()
    msg.reply msg.random friendly "...creating host and discoverying initiators..."
    msg.reply robot.host(  "create                    \
                            -hostname #{name}         \
                            -hostlabel #{name}        \
                            -un #{username}           \
                            -type #{type}             \
                            -hostssl true             \
                            -vcenter #{vcenter}       \
                            -datacenter #{datacenter} \
                            -cluster #{cluster}       \
                            -discover true" )


  robot.commands.push "hubot coprhd create host <name> os [Windows,HPUX,Linux,Esx,Other,AIXVIO,AIX,No_OS,SUN-VCS] username <username> password <password> wwpn <wwpn> and wwnn <wwnn>"
  robot.respond /((create|new) host) (.*) os (.*) username (.*) password (.*) wwpn (.*) and wwnn (.*)$/i, (msg) ->
    name      = msg.match[2].trim()
    type      = msg.match[3].trim()
    username  = msg.match[4].trim()
    password  = msg.match[5].trim()
    wwpn      = msg.match[6].trim()
    wwn       = msg.match[7].trim()
    msg.reply msg.random friendly "...creating host..."
    msg.reply robot.host(  "create             \
                            -hostname #{name}   \
                            -hostlabel #{name}  \
                            -un #{username}     \
                            -type #{type}       \
                            -hostssl true       \
                            -discover false" )

    msg.reply msg.random friendly "...creating and attaching initiators..."
    msg.reply robot.initiator(  "create       \
                                -hostlabel #{name} \
                                -wwn #{wwn}   \
                                -pwwn #{pwwn} \
                                -type fc \
                                -sync" )

robot.commands.push "hubot coprhd create host <name> os [Windows,HPUX,Linux,Esx,Other,AIXVIO,AIX,No_OS,SUN-VCS] username <username> password <password> iqn <iqn>"
robot.respond /((create|new) host) (.*) type (.*) username (.*) password (.*) wwpn (.*) and wwnn (.*)$/i, (msg) ->
  name      = msg.match[2].trim()
  type      = msg.match[3].trim()
  username  = msg.match[4].trim()
  password  = msg.match[5].trim()
  wwpn      = msg.match[6].trim()
  wwn       = msg.match[7].trim()
  msg.reply msg.random friendly "...creating host..."
  msg.reply robot.host(  "create             \
                          -hostname #{name}   \
                          -hostlabel #{name}  \
                          -un #{username}     \
                          -type #{type}       \
                          -hostssl true       \
                          -discover false" )

  msg.reply msg.random friendly "...creating and attaching initiators..."
  msg.reply robot.initiator(  "create       \
                              -hostlabel #{name} \
                              -pwwn #{pwwn} \
                              -type iscsi \
                              -sync" )

  robot.commands.push "hubot coprhd update host <name> add wwpn <wwpn> and wwnn <wwnn>"
  robot.respond /((update|change) host) (.*) add wwpn (.*) and wwnn (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
