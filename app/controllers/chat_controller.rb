class ChatController < ApplicationController
  
  def show
    @user_1 = User.find_by(name: params[:user_name])
    @user_2 = User.find_by(name: params[:other_user_name])
    @messages = Message.where(sender: @user_1, receiver: @user_2).or(Message.where(sender: @user_2, receiver: @user_1))
    @message = Message.new
  end
end