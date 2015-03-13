"use strict"

angular.module('cipher').controller 'homeCtrl', ($scope, $location, Cipher, Message) ->
    $scope.cipher = new Cipher cipher

    $scope.loadNew = ->
        Message.get (res) ->
            $scope.cipher.destroy
            $scope.cipher = new Cipher res
            return
        return
