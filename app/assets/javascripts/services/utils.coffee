"use strict"

angular.module('cipher').factory 'Utils', ->
    alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
             'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    ignoreChars = [" ", ".", ",", "?", "!", ";", ":", "—", "'", "-"]

    return {
        alphabet: alphabet
        ignoreChars: ignoreChars
    }
