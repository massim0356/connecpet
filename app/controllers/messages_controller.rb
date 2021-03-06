class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    @messages = @message.sender.messages_with(@message.receiver).order(:created_at)
    authorize @message
    if @message.save
      FriendChannel.broadcast_to(
        @message.sender,
        render_to_string(partial: 'messages/message', locals: { message: @message, viewer: @message.receiver, messages: @messages })
      )
      FriendChannel.broadcast_to(
        @message.receiver,
        render_to_string(partial: 'messages/message', locals: { message: @message, viewer: @message.sender, messages: @messages })
      )
      redirect_to friend_path(@message.receiver, anchor: "message-#{@message.id}")
    else
      render "friends/show"
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
