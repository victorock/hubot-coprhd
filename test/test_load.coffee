assert = require 'assert'
sinon = require 'sinon'
fs = require 'fs'
path = require 'path'

describe 'hubot-coprhd', ->
  beforeEach ->
    @robot =
      loadFile: sinon.spy()

    @app = require '../index'

  it 'can be imported without blowing up', ->
    assert @app != undefined

  it 'can run index', ->
    @app(@robot)

  it 'can import scripts', ->
    scripts_path = path.resolve __dirname, '../src'
    false unless fs.existsSync scripts_path

    for file in fs.readdirSync(scripts_path)
      script = require path.resolve scripts_path, file
      assert script != undefined
