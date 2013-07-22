class Message < ActiveRecord::Base
  READ   = 'read'
  UNREAD = 'unread'

  belongs_to :notice
  belongs_to :user
  attr_accessible :status, :user_id, :notice_id, :category
end
