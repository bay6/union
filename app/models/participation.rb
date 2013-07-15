#encoding:utf-8
class Participation < ActiveRecord::Base
  extend OctokitExtention

  ONGOING  = 'ongoing'
  FINISHED = 'finished'
  REQUESTED = 'requested'

  STATUS = {
    ONGOING  => '进行中',
    FINISHED => '结束',
    REQUESTED => '申请完成'
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

  before_update :update_score_by_project
  def update_score_by_project
    if self.changed? && self.changed.include?('status') && finished?
      create_record_when_finished
    end
  end
  private :update_score_by_project

  def create_record_when_finished
    begin
      user_name, project_name = project.website.split('/').last(2)
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
    rescue => err
      #todo 异常处理(没有该github账户和项目)
      logger.error(err)
      return
    end
  end
  private :create_record_when_finished
  handle_asynchronously :create_record_when_finished

  def create_record_today_when_finished_by_commits
    user_join_date = Participation.find_by_user_id_and_project_id(user_id, project_id).created_at
    commits_date_hash = project.repository.commits.where('commit_date >= :user_join_date and user_uid = :user_uid', user_join_date: user_join_date,  user_uid: user.uid).group('date(commit_date)').count
    commits_date_hash.each{|date, commits_count| Record.generate_or_update(user_id, date, commits_count, project_id)}
  end
  private :create_record_today_when_finished_by_commits

  def finished?
    status == FINISHED
  end

  def unfinished?
    !finished?
  end
end
