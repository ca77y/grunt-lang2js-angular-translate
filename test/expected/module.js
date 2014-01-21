(function () {
  'use strict';

  angular.module('translate.preloadLang', ['pascalprecht.translate'])
  .run(['$translateProvider', function($translateProvider) {
    $translateProvider.translations('en',
{
    "hello": "world"
}
    );
  }]);
});