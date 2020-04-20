# frozen_string_literal: true

class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ret = MessagesController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
    logger.debug "#{ret}"
    ActionCable.server.broadcast(
      "chatrooms:#{message.chatroom_id}:messages",
      message: MessagesController.render(
        partial: 'messages/message',
        locals: { message: message }
      )
    )
  end
end
