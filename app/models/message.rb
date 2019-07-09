class Message < ApplicationRecord

  validates_presence_of :content
  
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end