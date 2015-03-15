"use strict"

angular.module('cipher').directive 'caesarShift', ->
        restrict: 'EA'
        scope:
            cipherText: "="
        templateUrl: '/assets/directives/caesarShift.html'
        link: ($scope, $element) ->
            alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
                            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

            ignoreChars = [" ", ".", ",", "?", "!", ";", ":", "—", "'", "-"]

            calcCaesar = (cipherArray, offset) ->
                offset: offset
                message: cipherArray.map((el) ->
                    if ignoreChars.indexOf(el) < 0
                        idx = alpha.indexOf(el) + offset
                        alpha[if idx > 25 then idx - 26 else idx]
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
