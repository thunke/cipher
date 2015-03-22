"use strict"

angular.module('cipher').controller('homeCtrl', ['$scope', '$location', '$timeout', 'Cipher', 'Message', ($scope, $location, $timeout, Cipher, Message) ->
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

    $scope.orderPairs = (field, reverse) ->
        $scope.pairOrder = field
        $scope.pairReverse = reverse
        return

    $scope.openCustom = ->
        $scope.enterCustom = true
        $timeout( ->
            $('#customCipher').select()
        , 100)

    $scope.createCustom = ->
        $scope.cipher.destroy
        $scope.cipher = new Cipher
            cipher_text: $scope.customCipher
            custom: true
        $scope.enterCustom = false
        return

    $scope.orderPairs('order', false)
    $scope.activeTab = 1

    return
])
