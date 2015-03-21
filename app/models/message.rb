# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :text
#  author     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base

    ALPHABET = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                 "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    def encrypt
        arr = self.message.upcase.split(//)
        subs = []

        # return a caesar shift or a reverse alphabet cipher once in a blue moon
        n = Random.rand (1..100)
        if n == 1
            subs = caesarShift
        elsif n == 2
          subs = reverseAlphabet
        else
           subs = simpleSub
        end

        arr.map { |l| ALPHABET.index(l).nil? ? l : subs[ALPHABET.index l] }.join
    end


    protected
    def simpleSub
        subs = []
        a2 = ALPHABET.clone
        while a2.length > 0 do
            n = Random.rand (a2.length)
            subs.push(a2[n])
            a2.delete_at(n)
        end
        subs
    end


    protected
    def caesarShift
        subs = []
        shift = Random.rand (1..ALPHABET.length)
        i = 0
        while i < ALPHABET.length  do
            s = i + shift
            subs.push(ALPHABET[s > 25 ? s - 26 : s])
            i +=1
        end
        subs
    end

    protected
    def reverseAlphabet
        return ALPHABET.reverse
    end
end
