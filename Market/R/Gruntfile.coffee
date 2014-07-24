module.exports = (grunt) ->
  'use strict'

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-newer')

  grunt.registerMultiTask 'coffee', 'Compile CoffeeScript files into JavaScript', ->
    path = require('path')
    options = @options(
      bare: true
      separator: grunt.util.linefeed
    )
    grunt.verbose.writeflags options, 'Options'
    # grunt.log.warn @files
    # grunt.log.warn @target
    # grunt.log.warn @data.files[0].src
    # for k, v of options
    #     grunt.log.warn k + v
    # output = @data.files[0].src.filter((filepath) ->
    files = undefined
    if @files?
        files = @files
    else
        files = @data.files

    output = files[0].src.filter((filepath) ->
        if grunt.file.exists(filepath)
            true
        else
          grunt.log.warn 'Source file \'' + filepath + '\' not found.'
          false
    ).map((filepath) ->
        grunt.util.spawn
            cmd: 'coffee'
            args: ['-l', '-c', '-b', '-m', filepath]
            , (error, result, code) ->
                grunt.log.error error
                grunt.log.warn result
                grunt.log.warn code
                return

        # grunt.log.warn filepath
        # myTerminal = require("child_process").exec
        # myTerminal 'iced -l -c -b -m ' + filepath, (error, stdout, stderr) ->
        #     grunt.log.warn 'comssss'
        #     if error?
        #         grunt.log.error error
        #     grunt.log.warn stdout
        #     grunt.log.error stderr
        #     return
        compileCoffee filepath, options
    ) #.join(grunt.util.normalizelf(options.separator))
    # grunt.log.warn 'r'
    # grunt.log.warn output
    # for k, v of output
    #     grunt.log.warn k + v.sourceMap

  compileCoffee = (srcFile, options) ->
    options = grunt.util._.extend filename: srcFile, options
    srcCode = grunt.file.read srcFile
    try
    #   grunt.log.warn options
      return require('coffee-script').compile srcCode, options
    catch e
      grunt.log.error e
      grunt.fail.warn 'CoffeeScript failed to compile.'

  srcFiles = 'js/**/*.litcoffee'

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      all:
        options:
          runtime: 'none'
          compile: true
          literate: true
          sourceMap: true
        src: srcFiles
      build:
        options:
          runtime: 'none'
          compile: true
          literate: true
          sourceMap: true
        files: [{src: srcFiles}]

    watch:
        coffeescript:
            files: srcFiles
            tasks: ["newer:coffee:all"]
        javascript:
            files: "assets/**/*.js"
            tasks: ["uglify:dev"]
        livereload:
            files: ["Gruntfile.coffee", "js/*.js", "*.html"]
            options:
                livereload: true

  grunt.registerTask 'default', [
    'watch'
  ]
