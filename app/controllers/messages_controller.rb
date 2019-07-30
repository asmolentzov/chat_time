class MessagesController < ApplicationController
  
  def create
    message = Message.create(message_params)
    redirect_to chat_path(user_name: message.sender.name, other_user_name: message.receiver.name)
  end
  
  private
  
  def message_params
    raw_params = params.require(:message).permit(:content, :sender, :receiver)
    { 
      content: raw_params[:content],
      sender: User.find(raw_params[:sender]),
      receiver: User.find(raw_params[:receiver])
    }
  end
end