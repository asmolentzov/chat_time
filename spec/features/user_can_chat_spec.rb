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
      
      expect(current_path).to eq(chat_path)
      expect(page).to have_content("Hi " + @user_1.name + "! You are now chatting with " + @user_2.name + ".")
    end
    it 'can start a chat even if new to the site' do
      new_user_name = "Robot"
      new__user_name_two = "Chatbot"
      visit '/'
      
      fill_in :user_name, with: new_user_name
      fill_in :other_user_name, with: new__user_name_two
      click_button("Chat!")
      
      expect(current_path).to eq(chat_path)
      expect(page).to have_content("Hi " + new_user_name + "! You are now chatting with " + new__user_name_two + ".")
    end
  end

  describe 'on the chat page' do
    before(:each) do
      @message_1 = Message.create!(sender: @user_1, receiver: @user_2, content: "Hello friend")
      @message_2 = Message.create!(sender: @user_2, receiver: @user_1, content: "Hello, also friend!")
      @message_3 = Message.create!(sender: @user_1, receiver: @user_2, content: "How are you?")
      @message_4 = Message.create!(sender: @user_2, receiver: @user_1, content: "Spiffy!")
      
      visit '/'
      fill_in :user_name, with: @user_1.name
      fill_in :other_user_name, with: @user_2.name
      click_button("Chat!")
    end
    it 'can see past messages between the chatting users' do
      expect(page).to have_content("#{@user_1.name}: #{@message_1.content}")
      expect(page).to have_content("#{@user_2.name}: #{@message_2.content}")
      expect(page).to have_content("#{@user_1.name}: #{@message_3.content}")
      expect(page).to have_content("#{@user_2.name}: #{@message_4.content}")
    end
    it 'can send a new message' do
      content = 'Hello, friend!'
      fill_in :message_content, with: content
      click_button "Send"
      
      expect(current_path).to eq(chat_path)
      expect(page).to have_content("#{@user_1.name}: #{content}")
      message = Message.last
      expect(message.sender).to eq(@user_1)
      expect(message.receiver).to eq(@user_2)
      expect(message.content).to eq(content)
    end
    it 'can refresh messages' do
      new_message = Message.create(content: "New exciting message!", sender: @user_2, receiver: @user_1)
      
      expect(page).to_not have_content(new_message.content)

      click_on "Get New Messages"
      
      expect(page).to have_content(new_message.content)
    end
  end
end