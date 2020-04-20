# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    @message = Message.create content: params[:message][:content], chatroom: @chatroom, user: current_user
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

end
