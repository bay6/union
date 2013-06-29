class Participation < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :role, :status

  validates :project_id, :user_id, :role, :presence => true
end
