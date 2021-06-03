class FriendChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    receiver = User.find(params[:id])
    stream_for receiver
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
