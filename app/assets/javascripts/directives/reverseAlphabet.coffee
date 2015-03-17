"use strict"

angular.module('cipher').directive('reverseAlphabet', ['Utils', (Utils) ->
        restrict: 'EA'
        scope:
            cipherText: "="
        templateUrl: '/assets/directives/reverseAlphabet.html'
        link: ($scope, $element) ->
            reverseAlpha = _.clone(Utils.alphabet).reverse()

            $scope.$watch('cipherText', ->
                cipherArray = $scope.cipherText.split ""
                $scope.reverseVal = cipherArray.map((el) ->
                    if Utils.ignoreChars.indexOf(el) < 0
                        reverseAlpha[Utils.alphabet.indexOf el]
                    else
                        el
                ).join ""
                return
            )

            return
])
