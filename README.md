# grunt-lang2js-angular-translate [![Build Status](https://travis-ci.org/ca77y/grunt-lang2js-angular-translate.png)](https://travis-ci.org/ca77y/grunt-lang2js-angular-translate)

> Language preload for angular translate

## Getting started
This plugin requires Grunt `~0.4.0`

Please note this is a coffeescript task and the sources are located in src folder, javascript is generated.

## i18n task
_Run this task with the `grunt lang2js` command._
Task targets, files and options may be specified according to the grunt [Configuring tasks](http://gruntjs.com/configuring-tasks) guide.

This plugin compiles given translation file from angular translate into angular module to be preloaded. It works with [Angular Translate](https://github.com/PascalPrecht/angular-translate).
The problem this plugin solves is described [here](http://pascalprecht.github.io/angular-translate/docs/en/#/guide/10_asynchronous-loading#foucflashofuntranslatedcontent)

### Usage example

```
lang2js:
  happy_path:
    files:
      'tmp/module.js': 'test/fixtures/en.json'
    options:
      lang: 'en'
      module: 'translate.preloadLang'
```

### Options
Available options to configure the task.

#### module
Type: String

Name of the angular module that will be created.

## Release History
* 2014-01-21   v0.1.0   Initial release.
