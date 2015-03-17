"use strict"

angular.module('cipher').controller('homeCtrl', ['$scope', '$location', 'Cipher', 'Message', ($scope, $location, Cipher, Message) ->
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

    $scope.orderPairs('order', false)
    $scope.activeTab = 1

    return
])
