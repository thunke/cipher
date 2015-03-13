"use strict"

angular.module('cipher').factory 'Cipher', ->
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

        ignoreChars = [" ", ".", ",", "?", "!", ";", ":"]

        resetValuePairs: ->
            ctArray = @cipherText.split ""
            @valuePairs = []

            _.each ctArray, ((letter) ->
                if ignoreChars.indexOf(letter) < 0
                    pair = _.findWhere @valuePairs, cipherVal: letter
                    if pair then pair.count++ else @valuePairs.push
                        cipherVal: letter
                        clearVal: letter
                        count: 1
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

            _.each ctArray, ((letter, i) ->
                if ignoreChars.indexOf(letter) < 0
                    pair = _.findWhere @valuePairs, cipherVal: letter
                    if pair then pair.count++ else @valuePairs.push
                        cipherVal: letter
                        clearVal: slnArray[i]
                        count: 1
                return
            ), this
            @solutionFromServer = true
            @renderClearText()
            return
