"use strict"

angular.module('cipher').factory 'Cipher', ->
    class Cipher
        constructor: (@cipherText) ->
            @clearText = @cipherText
            @valuePairs = @resetValuePairs()

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
            @valuePairs

        renderClearText: ->
            cytArray = @cipherText.split ""
            clrArray = []

            cytArray.forEach ((letter) ->
                pair = _.findWhere @valuePairs, cypherVal: letter
                clrArray.push pair.clearVal
                return
            ), this
            return
