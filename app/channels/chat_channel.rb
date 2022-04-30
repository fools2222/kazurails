class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    stream_from current_user.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["sentence"]
      Chat.create!(
        user_id: data["current_user_id"].to_i,
        partner_id: data["partner_id"].to_i,
        sentence: data["sentence"]
      )
      ChatChannel.broadcast_to data["current_user_id"].to_i,
      sentence: data["sentence"],
      partner_id: data["partner_id"],
      isCurrent_user: true

      ChatChannel.broadcast_to data["partner_id"].to_i,
      sentence: data["sentence"],
      partner_id: data["partner_id"],
      isCurrent_user: false
    end

  end
  
end
