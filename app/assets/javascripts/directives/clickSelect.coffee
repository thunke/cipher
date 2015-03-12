"use strict"

angular.module('cipher').directive 'clickSelect', ->
    restrict: 'AC'
    link: ($scope, $element) ->
        $element.bind 'click', ->
            this.select()
