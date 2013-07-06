#encoding:utf-8
class Participation < ActiveRecord::Base
  extend OctokitExtention

  ONGOING  = 'ongoing'
  FINISHED = 'finished'

  STATUS = {
    ONGOING  => '进行中',
    FINISHED => '结束'
  }

  LEADER = 'leader'
  MEMBER = 'member'

  ROLE = {
    LEADER => '队长',
    MEMBER => '成员'
  }

  belongs_to :project
  belongs_to :user
  attr_accessible :role, :status, :project_id, :user_id

  validates :project_id, :user_id, :presence => true
  validates_uniqueness_of :user_id, :scope => [:project_id]



  before_create :set_default_role_and_status
  def set_default_role_and_status
    self.role   = MEMBER
    self.status = ONGOING
  end
  private :set_default_role_and_status

  before_update :create_record_when_finished
  def create_record_when_finished
    begin
      user_name, project_name = project.website.split('/').last(2)
      if self.changed? && self.changed.include?('status') && finished?
        @client = User.authenticated_api
        contributors = @client.contributors("#{user_name}/#{project_name}", true)
        contributions = contributors.select {|c| c.login == user.name }.last.contributions
        Record.create!(:project_id => project_id,
                       :project_name => project.name,
                       :user_id => user_id,
                       :user_name => user.name,
                       :weights => project.try(:grade).try(:weights),
                       :value => project.try(:grade).try(:weights) * contributions,
                       :category => "project"
                      )
        create_record_today_when_finished_by_commits
      end
    rescue => err
      #todo 异常处理(没有该github账户和项目)
      logger.error(err)
      return
    end
  end
  private :create_record_when_finished

  def create_record_today_when_finished_by_commits
    user_name, project_name = project.website.split('/').last(2)
    @client = User.authenticated_api

    all_commits = []
    commits = Array.new(100)
    last_commit = @client.commits_on("#{user_name}/#{project_name}", Date.today.to_s).first
    return if last_commit.blank?
    begin
      commits = @client.commits_on("#{user_name}/#{project_name}", Date.today.to_s, 'master', {per_page: 100, sha: last_commit.sha}).select {|c| c.author.login == user.name}
      last_commit = commits.last
      all_commits += commits
    end until commits.count < 100
    commits_count = all_commits.size
    return if commits_count == 0
    Record.create!(:project_id => project_id,
                   :project_name => project.name,
                   :user_id => user_id,
                   :user_name => user.name,
                   :weights => project.try(:grade).try(:weights),
                   :value => project.try(:grade).try(:weights) * commits_count,
                   :category => "commit"
                  )
  end

  def finished?
    status == FINISHED
  end

  def unfinished?
    !finished?
  end
end
