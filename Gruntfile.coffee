'use strict'

module.exports = (grunt) ->

  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      dist:
        files:
          src: [
            '**/*.coffee'
            '!node_modules/**'
          ]

    jsonlint:
      src: [
        'package.json'
        'coffeelint.json'
      ]

    simplemocha:
      options:
        ui: 'bdd'
        reporter: 'spec'
        compilers: 'coffee:coffee-script'
        ignoreLeaks: no
      dist:
        src: [ 'test/test_*.coffee' ]

  grunt.registerTask 'test',    [ 'jsonlint', 'coffeelint', 'simplemocha' ]

  require 'coffee-errors'
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks
