# Data Model
class CoprHD
  constructor: (url, username, password)  ->
    @properties =
      url: url
      username: username
      password: password
      cookieDir: '/tmp'
      cookieFile: 'cookie-root@provider'
    this

  url: (newVal) ->
      @properties.url = newVal
      this

  username: (newVal) ->
      @properties.username = newVal
      this

  password: (newVal) ->
      @properties.password = newVal
      this

  cookieDir: (newVal) ->
      @properties.cookieDir = newVal
      this

  cookieFile: (newVal) ->
      @properties.cookieFile = newVal
      this

  cli: (options) ->
    command = "/opt/storageos/cli/bin/viprcli #{options}"
    run = require('child_process').exec
    run command, (error, stdout, stderr) ->
      return {  error: error
                stdout: stdout
                stderr: stderr
              }

  login: ->
    return @cli( "authenticate                      \
                  -hostname #{@properties.url}      \
                  -username #{@properties.username} \
                  -d #{@properties.cookieDir}       \
                  -p #{@properties.password}" )

class VArray
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this


class Volume
  constructor: (name, size) ->
    @properties =
      name: name
      size: size
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    @cli
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this


class Snapshot
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this


class Project
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this


class Tenant
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this

class Host
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this

class Initiator
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this

class Cluster
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this

class Filesystem
  constructor: (name, size) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this

class Exportgroup
  constructor: (name) ->
    @properties =
      name: name
    this

  name: (newVal) ->
    @properties.name = newVal
    this

  list: ->
    this

  show: ->
    this

  create: ->
    this

  update: ->
    this
