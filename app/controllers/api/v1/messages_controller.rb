class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @message = Message.new(
      content: params[:content],
      user_id: current_user.id,
      chatroom_id: params[:chatroom_id]
    )
    if @message.save
      ActionCable.server.broadcast "messages-#{params[:chatroom_id]}",
        content: @message.content,
        email: @message.user.email
      render 'show.json.jbuilder'
    end
  end
end
