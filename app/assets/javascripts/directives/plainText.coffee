"use strict"

angular.module('cipher').directive('plainText', ['$timeout', '$sanitize', ($timeout, $sanitize) ->
        scope:
            text: "="
        restrict: 'EA'
        replace: true
        template: '<p ng-bind-html="text"></p>'
        link: ($scope, $element) ->
            $scope.$watch('text', (newVal) ->
                $($element).find('.highlight').each ->
                    el = $(this)
                    delay = Math.floor(Math.random()*1000+1000)
                    setTimeout( ->
                        el.removeClass('highlight')
                    , delay)
            )
            return
])
