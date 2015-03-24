class MessagesController < ApplicationController
  respond_to :json, :html

  def show
    @pageClass = "home"

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

    respond_to do |format|
      format.html
      format.json { render json: @cipher }
    end
  end

  def solution
    @message = Message.find params[:id]
    respond_with( { :solution => @message.message.upcase }.to_json )
  end
end
