class BadgeUsers < ActiveRecord::Base
  attr_accessible :content, :badge_id, :user_id

  validates :badge_id, :user_id, :presence => true
  validates_uniqueness_of :badge_id, :scope => [:user_id]

  belongs_to :user
  belongs_to :badge
end
