"use strict"

angular.module('cipher').factory('Cipher', ['Utils', (Utils) ->
    class Cipher
        constructor: (cipher) ->
            @id = cipher.id
            @cipherText = cipher.cipher_text
            @clearText = @cipherText
            @author = cipher.author
            @solution = cipher.solution
            @revealAuthor = false
            @resetValuePairs()
            @solved = false
            @solutionFromServer = false

        resetValuePairs: ->
            ctArray = @cipherText.split ""
            @valuePairs = []
            order = 0

            _.each ctArray, ((letter) ->
                if Utils.ignoreChars.indexOf(letter) < 0
                    pair = _.findWhere @valuePairs, cipherVal: letter
                    if pair then pair.count++ else @valuePairs.push
                        cipherVal: letter
                        clearVal: letter
                        count: 1
                        order: order++
                return
            ), this
            @renderClearText()
            return

        renderClearText: ->
            ctArray = @cipherText.split ""
            clrArray = []

            ctArray.forEach ((letter) ->
                pair = _.findWhere @valuePairs, cipherVal: letter
                clrArray.push if pair then pair.clearVal else letter
                return
            ), this
            @clearText = clrArray.join ""
            @solved = @solution == CryptoJS.SHA1(@clearText.toUpperCase()).toString()
            return

        solve: (solution) ->
            ctArray = @cipherText.split ""
            slnArray = solution.split ""
            @valuePairs = []
            order = 0

            _.each ctArray, ((letter, i) ->
                if Utils.ignoreChars.indexOf(letter) < 0
                    pair = _.findWhere @valuePairs, cipherVal: letter
                    if pair then pair.count++ else @valuePairs.push
                        cipherVal: letter
                        clearVal: slnArray[i]
                        count: 1
                        order: order++
                return
            ), this
            @solutionFromServer = true
            @renderClearText()
            return
])
