module.exports = (robot) ->
  robot.commands.push "hubot coprhd new vmware datastore <name> of size <volume>"
  robot.respond /(create|new) vmware datastore (.*) of size (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd delete vmware datastore <name>"
  robot.respond /(delete|remove) vmware datastore (.*)$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

  robot.commands.push "hubot coprhd mount vmware datastore <name> on <cluster>"
  robot.respond /(mount|format) vmware datastore on <cluster>$/i, (msg) ->
    msg.reply msg.random friendly "...action not implemented yet..."
    #msg.reply robot.coprhdcli("")

    robot.commands.push "hubot coprhd unmount vmware datastore <name>"
    robot.respond /(unmount|format) vmware datastore on <cluster>$/i, (msg) ->
      msg.reply msg.random friendly "...action not implemented yet..."
      #msg.reply robot.coprhdcli("")
