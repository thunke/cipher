"use strict"

angular.module('cipher').directive('dropdown', ['$timeout', ($timeout) ->
        restrict: 'EA'
        replace: true
        transclude: true
        scope:
            transition: "@"
        template: '<div class="ui dropdown" ng-transclude></div>'
        link: ($scope, $element) ->            
            $timeout( ->
                $($element).dropdown
                    transition: $scope.transition || 'drop'
            , 250)
            return
])
