"use strict"

angular.module('cipher').controller 'homeCtrl', ($scope, $location, Cipher) ->
    $scope.cipher = new Cipher ciphers[0]
