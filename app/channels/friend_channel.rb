class FriendChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    receiver = User.find(params[:id])
    stream_for receiver

    if current_user

      ActionCable.server.broadcast "friend_channel", { user: current_user.id, online: :on }

      current_user.online = true

      current_user.save

    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # receiver = User.find(params[:id])
    # stream_for receiver
    # if current_user

    #   # Any cleanup needed when channel is unsubscribed
    #   ActionCable.server.broadcast "friend_channel", { user: current_user.id, online: :off }

    #   current_user.online = false

    #   current_user.save

    # end
  end
end
