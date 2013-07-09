class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :category, :project_id, :user_id, :value, :weights, :user_name, :project_name, :commit_date

  validates :project_id, :user_id, :presence => true

  default_scope order("commit_date")

  def self.generate_or_update(user, date, commits_count, project)
    #record = Record.where(user_id: user.id, commit_date: date, project_id: project.id).first_or_create # rails4
    record = Record.find_or_create_by_user_id_and_commit_date_and_project_id(user.id, date, project.id)
    record.update_attributes(
      category: 'commit',
      value: project.try(:grade).try(:weights) * commits_count.to_i,
      weights: project.try(:grade).try(:weights),
      user_name: user.name,
      project_name: project.name
    )
  end

  #after_save :increase_score
  #def increase_score
    #if self.changed? && self.changed.include?('value')
      #value_array = self.previous_changes["value"]
      #value = value_array.last.to_i - value_array.first.to_i
      #user.score += value
      #user.save
    #end
  #end
  #private :increase_score

  #after_destroy :decrease_score
  #def decrease_score
    #user.score -= value
    #user.save
  #end
  #private :decrease_score
end
