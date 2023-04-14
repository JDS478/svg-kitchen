class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @message = Message.new
    # raise
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
