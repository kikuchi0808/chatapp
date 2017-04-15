class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params['room_id'])
    stream_for room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(text: data['message'], talker_id: data['talker_id'], room_id: data['room_id'])
  end
end
