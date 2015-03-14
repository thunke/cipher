"use strict"

angular.module('cipher').directive 'reverseAlphabet', ->
        restrict: 'EA'
        scope:
            cipherText: "="
        templateUrl: '/assets/directives/reverseAlphabet.html'
        link: ($scope, $element) ->
            alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
                            'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
            reverseAlpha = _.clone(alpha).reverse()
            ignoreChars = [" ", ".", ",", "?", "!", ";", ":", "—", "'", "-"]

            $scope.$watch('cipherText', ->
                cipherArray = $scope.cipherText.split ""
                $scope.reverseVal = cipherArray.map((el) ->
                    if ignoreChars.indexOf(el) < 0
                        reverseAlpha[alpha.indexOf el]
                    else
                        el
                ).join ""
                return
            )

            return
