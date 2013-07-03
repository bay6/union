class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login], omniauth_providers: [:github]


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :name, :provider, :uid
  attr_accessor :login

  has_many :participations
  has_many :records, dependent: :destroy
  has_many :projects, through: :participations
  has_many :finished_projects, through: :participations, source: :project, conditions: ["participations.status = ?", Participation::FINISHED]
  has_many :ongoing_projects, through: :participations, source: :project, conditions: ["participations.status = ?", Participation::ONGOING]

  validates :name, uniqueness: true

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

  # create record and update score by commits everyday
  def update_score_by_commits
    self.ongoing_projects.each do |project|
      user_and_project = project.website.split('/').last(2).join('/')
      response = RestClient.get "https://api.github.com/repos/#{user_and_project}/commits?author=#{name}"
      commits = JSON.parse response.body
      binding.pry
    end
  end
end
