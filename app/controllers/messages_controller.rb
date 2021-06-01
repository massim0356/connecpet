class MessagesController < ApplicationController
  # @message = Message.new(message_params)
  #   @message.chatroom = @chatroom
  #   @message.user = current_user
  #   if @message.save
  #     # we need to tell everyone listening, that a message was created
  #     # we want to send a message with HTML to the subscribers
  #     ChatroomChannel.broadcast_to(
  #       @chatroom,
  #       render_to_string(partial: 'messages/message', locals: { message: @message })
  #     )
  #     redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
  #   else
  #     render "friends/show"
  #   end
  # end

  # def message_params
  #   params.require(:message).permit(:content)
  # end
end
