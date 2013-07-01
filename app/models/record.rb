class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :category, :project_id, :user_id, :value, :weights, :user_name, :project_name

  validates :project_id, :user_id, :presence => true

  after_create :increase_score
  def increase_score
    user.score += value
    user.save
  end
  private :increase_score

  after_destroy :decrease_score
  def decrease_score
    user.score -= value
    user.save
  end
end
