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
            @clearText2 = @cipherText

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

        renderClearText: (newVal) ->
            ctArray = @cipherText.split ""
            clrArray = []

            ctArray.forEach ((letter) ->
                pair = _.findWhere @valuePairs, cipherVal: letter
                clrArray.push if pair then pair.clearVal else letter
                return
            ), this
            @clearText = clrArray.join ""
            @clearMarkup = @buildHTML(clrArray, newVal)
            @solved = @solution == CryptoJS.SHA1(@clearText.toUpperCase()).toString()
            return

        buildHTML: (clrArray, newVal) ->
            return clrArray.map (el) ->
                if newVal and el.toUpperCase() == newVal.toUpperCase() then cls = "highlight"
                _.template('<span class="{{cls}}">{{el}}</span>', {el: el, cls: cls})
            .join ""

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
