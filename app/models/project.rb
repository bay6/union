class Project < ActiveRecord::Base
  belongs_to :grade
  belongs_to :user
  attr_accessible :description, :finished_at, :name, :started_at, :status, :website, :grade_id

  has_many :users, through: :participations
  has_many :participations

  validates :name, :description, :status, :user_id, :grade_id, :presence => true
end
