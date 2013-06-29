class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :category, :project_id, :user_id

  validates :project_id, :user_id, :presence => true
end
