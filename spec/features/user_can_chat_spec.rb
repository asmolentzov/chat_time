require 'rails_helper'

describe 'As a user' do
  describe 'on the main site' do
    it 'can start a chat' do
      user_1 = User.create(name: 'Human')
      user_2 = User.create(name: 'Also Human')
      visit '/'
      
      expect(page).to have_content('Who are you?')
      expect(page).to have_content('Who do you want to chat with?')
      fill_in :user_name, with: user_1.name
      fill_in :other_user_name, with: user_2.name
      click_button("Chat!")
      
      expect(page).to have_content("Hi " + user_1.name + "! You are now chatting with " + user_2.name + ".")
    end
  end
end