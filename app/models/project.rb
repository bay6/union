#encoding: utf-8
class Project < ActiveRecord::Base
  GRADING   = 'grading'
  ONGOING   = 'ongoing'
  FINISHED  = 'finished'
  REQUESTED = 'requested'

  STATUS = {
    GRADING   => '定级中',
    ONGOING   => '进行中',
    FINISHED  => '结束',
    REQUESTED => '申请完成'
  }

  attr_accessible :description, :finished_at, :name, :started_at, :status, :website, :grade_id, :user_id, :content

  belongs_to :grade
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations
  has_many :completers, through: :participations, source: :user, conditions: ["participations.status = ?", Participation::FINISHED]
  has_one :repository

  validates :name, :description, :status, :content, :presence => true

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

  def self.live? repo
    Project.cached_ongoing_projects.pluck(:name).include? repo.name
  end


  # project init
  def self.get_bay6_repos
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
    brepos = @client.repos( 'bay6')
    brepos.each do |repo|
      p = Project.find_or_initialize_by_name(repo.name,
                                         :website => repo.html_url,
                                         :description => repo.description,
                                        )
      p.update_attributes(
        :grade_id => 1,
        :user_id => 1,
        :status => Project::GRADING
      ) unless p.persisted?
      p.save! :validate => false
    end
  end

  private :finish_participation

  def self.cached_ongoing_projects
    Rails.cache.fetch(["ongoing", self]) { Project.where(status: Project::ONGOING).includes(:grade, :user) }
  end

  def self.cached_all_projects
    Rails.cache.fetch(["all", self]) { Project.includes(:grade, :user) } 
  end

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
