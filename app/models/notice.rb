class Notice < ActiveRecord::Base
  belongs_to :user
  has_many :messages, dependent: :destroy
  attr_accessible :content, :title
end
