class ChatController < ApplicationController
  
  def show
    @user_1 = User.find_by(name: params[:user_name])
    @user_2 = User.find_by(name: params[:other_user_name])
  end
end