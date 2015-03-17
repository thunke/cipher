"use strict"

angular.module('cipher').factory 'Utils', ->
    alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
             'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    ignoreChars = [" ", ".", ",", "?", "!", ";", ":", "—", "'", "-"]

    # Standard English Letter Frequency
    # Reference: http://www.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html
    standardDist = [
        { letter: "A", count: 14810 }
        { letter: "B", count: 2715 }
        { letter: "C", count: 4943 }
        { letter: "D", count: 7874 }
        { letter: "E", count: 21912 }
        { letter: "F", count: 4200 }
        { letter: "G", count: 3693 }
        { letter: "H", count: 10795 }
        { letter: "I", count: 13318 }
        { letter: "J", count: 188 }
        { letter: "K", count: 1257 }
        { letter: "L", count: 7253 }
        { letter: "M", count: 4761 }
        { letter: "N", count: 12666 }
        { letter: "O", count: 14003 }
        { letter: "P", count: 3316 }
        { letter: "Q", count: 205 }
        { letter: "R", count: 10977 }
        { letter: "S", count: 11450 }
        { letter: "T", count: 16587 }
        { letter: "U", count: 5246 }
        { letter: "V", count: 2019 }
        { letter: "W", count: 3819 }
        { letter: "X", count: 315 }
        { letter: "Y", count: 3853 }
        { letter: "Z", count: 128 }
    ]

    return {
        alphabet: alphabet
        ignoreChars: ignoreChars
        standardDist: standardDist
    }
