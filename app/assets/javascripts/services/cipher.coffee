"use strict"

angular.module('cipher').factory 'Cipher', ->
    class Cipher
        constructor: (cipher) ->
            @cipherText = cipher.cipher_text
            @clearText = @cipherText
            @author = cipher.author
            @solution = cipher.clear_text
            @revealAuthor = false
            @resetValuePairs()
            @solved = false

        illegalChars = [" ", ".", ","]

        resetValuePairs: ->
            cytArray = @cipherText.split ""
            @valuePairs = []

            _.each cytArray, ((letter) ->
                if illegalChars.indexOf(letter) < 0
                    pair = _.findWhere @valuePairs, cypherVal: letter
                    if pair then pair.count++ else @valuePairs.push
                        cypherVal: letter
                        clearVal: letter
                        count: 1
                return
            ), this
            return

        renderClearText: ->
            cytArray = @cipherText.split ""
            clrArray = []

            cytArray.forEach ((letter) ->
                pair = _.findWhere @valuePairs, cypherVal: letter
                clrArray.push if pair then pair.clearVal else letter
                return
            ), this
            @clearText = clrArray.join ""
            @solved = @clearText == @solution
            return
