"use strict"

angular.module('cipher').directive('caesarShift', ['Utils', (Utils) ->
        restrict: 'EA'
        scope:
            cipherText: "="
        templateUrl: '/assets/directives/caesarShift.html'
        link: ($scope, $element) ->

            calcCaesar = (cipherArray, offset) ->
                offset: offset
                message: cipherArray.map((el) ->
                    if Utils.ignoreChars.indexOf(el) < 0
                        idx = Utils.alphabet.indexOf(el) + offset
                        Utils.alphabet[if idx > 25 then idx - 26 else idx]
                    else
                        el
                ).join ""

            $scope.$watch('cipherText', ->
                cipherArray = $scope.cipherText.split ""
                $scope.caesars = []
                $scope.caesars.push calcCaesar(cipherArray, i) for i in [1..26]
                return
            )

            return
])
