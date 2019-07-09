require 'rails_helper'

describe 'As a user' do
  
  before(:each) do
    @user_1 = User.create(name: 'Human')
    @user_2 = User.create(name: 'Also Human')
  end
  
  describe 'on the main site' do
    it 'can start a chat' do
      visit '/'
      
      expect(page).to have_content('Who are you?')
      expect(page).to have_content('Who do you want to chat with?')
      fill_in :user_name, with: @user_1.name
      fill_in :other_user_name, with: @user_2.name
      click_button("Chat!")
      
      expect(page).to have_content("Hi " + @user_1.name + "! You are now chatting with " + @user_2.name + ".")
    end
  end
  
  describe 'on the chat page' do
    it 'can see past messages between the chatting users' do
      message_1 = Message.create(sender: @user_1, receiver: @user_2, content: "Hello friend")
      message_2 = Message.create(sender: @user_2, receiver: @user_1, content: "Hello, also friend!")
      message_3 = Message.create(sender: @user_1, receiver: @user_2, content: "How are you?")
      message_4 = Message.create(sender: @user_2, receiver: @user_1, content: "Spiffy!")
      visit '/'
      fill_in :user_name, with: @user_1.name
      fill_in :other_user_name, with: @user_2.name
      click_button("Chat!")
      
      expect(page).to have_content("#{@user_1.name}: #{message_1.content}")
      expect(page).to have_content("#{@user_2.name}: #{message_2.content}")
      expect(page).to have_content("#{@user_1.name}: #{message_3.content}")
      expect(page).to have_content("#{@user_2.name}: #{message_4.content}")
    end
  end
end