class Message < ActiveRecord::Base
  belongs_to :notice
  belongs_to :user
  attr_accessible :status
end
