module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['tmp', 'lib']

    coffeelint:
      tasks: 'src/**/*.coffee'
      test: 'test/**/*.coffee'
      grunt: 'Gruntfile.coffee'
      options:
        max_line_length:
          value: 120
          level: 'error'
        no_trailing_whitespace:
          level: 'error'
        no_tabs:
          level: 'error'
        indentation:
          value: 2
          level: 'error'

    coffee:
      tasks:
        files:
          'tasks/lang2js.js': 'src/lang2js.coffee'
      options:
        bare: true
        header: true

    lang2js:
      happy_path:
        files:
          'tmp/module.js': 'test/fixtures/en.json'
        options:
          lang: 'en'

    nodeunit:
      tests: ['test/*_test.coffee']

  grunt.loadTasks 'src'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'

  grunt.registerTask 'default', ['clean', 'coffeelint', 'coffee']
  grunt.registerTask 'test', ['clean', 'coffeelint', 'lang2js', 'nodeunit']
