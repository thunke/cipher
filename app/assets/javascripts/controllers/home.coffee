"use strict"

angular.module('cipher').controller 'homeCtrl', ($scope, $location, Cipher, Message) ->
    $scope.cipher = new Cipher cipher

    $scope.loadNew = ->
        Message.get (res) ->
            $scope.cipher.destroy
            $scope.cipher = new Cipher res
            return
        return

    $scope.solve = ->
        Message.solve( id: $scope.cipher.id, (res) ->
            $scope.cipher.solve res.solution
            return
        )
        return

    return
