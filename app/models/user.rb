# coding: utf-8

class User < ActiveRecord::Base
  extend OctokitExtention
  devise :database_authenticatable, :registerable,
         :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login], omniauth_providers: [:github]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :name, :provider, :uid, :grade_id, :admin, :grade
  attr_accessor :login

  has_many :participations
  has_many :records, dependent: :destroy
  has_many :projects, through: :participations
  has_many :finished_projects, through: :participations, source: :project, conditions: ["participations.status = ?", Participation::FINISHED]
  has_many :ongoing_projects, through: :participations, source: :project, conditions: ["participations.status = ?", Participation::ONGOING]
  belongs_to :grade

  validates :name, uniqueness: true

  before_create :default_user_grade

  scope :without_user, lambda{|user| user ? {:conditions => ["id != ?", user.id]} : {} }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def unfinished_project?(project_id)
    Participation.where(user_id: id, project_id: project_id).last.try(:status) != Participation::FINISHED
  end

  def update_records_by_commits
    self.ongoing_projects.each do |project|
      user_join_date = Participation.find_by_user_id_and_project_id(self.id, project.id).created_at - 20.days #dirty fixed to added those scores before project 
      commits_date_hash = project.repository.commits.where('commit_date >= :user_join_date and user_uid = :user_uid', user_join_date: user_join_date,  user_uid: self.uid).group('date(commit_date)').count
      commits_date_hash.each{|date, commits_count| Record.generate_or_update(self, date, commits_count, project)}
    end
  end

  def self.update_all_scores
    puts "update all scores started at #{Time.current}"
    User.all.each do |u|
      u.update_records_by_commits
      u.update_score_by_records
      u.reload
      puts "update #{u.name} #{u.score} at #{Date.today}"
    end
    puts "update all score ended at #{Time.current}"
  end

  def update_score_by_records
    self.score = Record.where(user_id: self.id).sum(&:value)
    self.save
  end

  def month_exp
    @month_exp ||= records.where('commit_date >= :month', month: Date.today.at_beginning_of_month).sum(&:value) + records.where('commit_date is null and created_at >= :month', month: Date.today.at_beginning_of_month).sum(&:value)
  end

  def week_exp
    @week_exp ||= records.where('commit_date >= :week', week: Date.today.at_beginning_of_week).sum(&:value) + records.where('commit_date is null and created_at >= :week', week: Date.today.at_beginning_of_week).sum(&:value)
  end

  def join_project project_id
    project_grade = Project.find(project_id).grade
    if grade
      grade.weights >= project_grade.weights
    else
      false
    end
  end

  private

  def default_user_grade
    self.grade = Grade.find_by_weights(1)
  end

end
