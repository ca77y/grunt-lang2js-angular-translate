grunt = require 'grunt'

exports.lang2js =
  happy_path: (test) ->
    test.expect 1

    expected = grunt.file.read 'test/expected/module.js'
    actual = grunt.file.read 'tmp/module.js'
    test.equal expected, actual, 'should translate a template to english'

    test.done()