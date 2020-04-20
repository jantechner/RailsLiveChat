class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    logger.debug "Chatroom #{data['chatroom_id']}"
    stream_from "chatrooms:#{data['chatroom_id']}:messages"
  end

  def unfollow
    stop_all_streams
  end
end
