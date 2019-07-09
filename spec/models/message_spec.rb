require 'rails_helper'

describe Message do
  describe 'Validations' do
    it { should validate_presence_of(:content) }
  end
  describe 'Relationships' do
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:receiver).class_name('User') }
  end
end
