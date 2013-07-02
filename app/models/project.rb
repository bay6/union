#encoding:utf-8
class Project < ActiveRecord::Base
  GRADING  = 'grading'
  ONGOING  = 'ongoing'
  FINISHED = 'finished'

  STATUS = {
    GRADING  => '定级中',
    ONGOING  => '进行中',
    FINISHED => '结束'
  }

  attr_accessible :description, :finished_at, :name, :started_at, :status, :website, :grade_id, :user_id

  belongs_to :grade
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations
  has_many :completers, through: :participations, source: :user, conditions: ["participations.status = ?", Participation::FINISHED]

  validates :name, :description, :status, :presence => true

  after_save :finish_participation
  def finish_participation
    if self.changed? && self.changed.include?('status') && finished?
      participations.each do |p|
        if p.unfinished?
          p.status = Participation::FINISHED
          p.save!
        end
      end
    end
  end
  private :finish_participation

  def create_default_participation
    Participation.create!(:project_id=> id,
                          :user_id => user_id)
  end

  def sponsor
    try(:user).try(:name)
  end

  def captain
    participations.find_by_role(Participation::LEADER).try(:user).try(:name)
  end

  def finished?
    status == FINISHED
  end
end
