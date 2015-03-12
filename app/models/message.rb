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

    def encrypt
        arr = self.message.upcase.split(//)
        alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                     "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        a2 = alphabet.clone
        subs = []

        while a2.length > 0 do
            n = Random.rand (a2.length)
            subs.push(a2[n])
            a2.delete_at(n)
        end

        arr.map { |l| alphabet.index(l).nil? ? l : subs[alphabet.index l] }.join
    end
end
