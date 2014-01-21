path = require 'path'

module.exports = (grunt) ->
  grunt.registerMultiTask 'lang2js', 'Preload Angular Translate language', ->
    options = @options
      module: 'translate.preloadLang'
      lang: null

    grunt.verbose.writeflags options, 'Options'
    if not options.lang?
      grunt.fail.warn "'lang' options is required"

    for files in @files
      localePath = removeInvalidFiles files
      locale = grunt.file.read localePath
      templateOptions =
        module: options.module
        lang: options.lang
        locale: locale
      output = grunt.template.process moduleTemplate, data: templateOptions
      grunt.file.write files.dest, output

  removeInvalidFiles = (files) ->
    validFiles = files.src.filter (filepath) ->
      if not grunt.file.exists filepath or not grunt.file.isFile filepath
        grunt.log.warn "Source file #{filepath} not found or is not a file"
        false
      else
        true
    if validFiles.length > 1
      grunt.fail.warn "Only one locale file should be provided in the src but instead it was: #{validFiles}"
    validFiles[0]

  moduleTemplate =
    """
      (function () {
        'use strict';

        angular.module('<%= module %>', ['pascalprecht.translate'])
        .run(['$translateProvider', function($translateProvider) {
          $translateProvider.translations('<%= lang %>',
      <%= locale %>
          );
        }]);
      });
    """