module.exports = {
  canAccess: (robot, user) ->
    return true if process.env.HUBOT_COPRHD_DEV

    if robot.auth.isAdmin(user)
      return true

    role = process.env.HUBOT_COPRHD_ROLE
    if role && robot.auth.hasRole(user, role)
      return true
    else
      return false
}
