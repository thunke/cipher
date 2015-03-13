class MessagesController < ApplicationController
  respond_to :json, :html

  def show
    if params[:id]
      @message = Message.find_by_id params[:id]
    end

    if @message.nil?
      @message = Message.offset(rand(Message.count)).first
    end

    @cipher = {
      :id => @message.id,
      :cipher_text => @message.encrypt(),
      :author => @message.author,
      :solution => Digest::SHA1.hexdigest(@message.message.upcase)
    }

    respond_with :api, @cipher
  end

  def solution
    @message = Message.find params[:id]
    respond_with :api, @message.message
  end
end
