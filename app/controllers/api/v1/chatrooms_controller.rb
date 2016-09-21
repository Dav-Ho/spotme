class Api::V1::ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(id: params[:id])
  end
end
