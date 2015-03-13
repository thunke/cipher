class HomeController < ApplicationController
  def index
    @messages = Message.all
    @ciphers = []

    @messages.each do |m|
        @ciphers.push({
            :id => m.id,
            :cipher_text => m.encrypt(),
            :author => m.author,
            :solution => Digest::SHA1.hexdigest(m.message.upcase)
        })
    end
  end
end
