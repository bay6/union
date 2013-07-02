#encoding:utf-8
class Participation < ActiveRecord::Base
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
      if self.changed? && self.changed.include?('status') && finished?
        response = RestClient.get "https://api.github.com/repos/#{user.name}/#{project.name}/contributors"
        contributors = JSON.parse response.body
        contributions = contributors.select {|c| c['login'] == user.name }.last['contributions']
        Record.create!(:project_id => project_id,
                       :project_name => project.name,
                       :user_id => user_id,
                       :user_name => user.name,
                       :weights => project.try(:grade).try(:weights),
                       :value => project.try(:grade).try(:weights) * contributions,
                       :category => "project"
                      )
      end
    rescue => err
      #todo 异常处理(没有该github账户和项目)
      logger.error(err)
      return
    end
  end
  private :create_record_when_finished

  def finished?
    status == FINISHED
  end

  def unfinished?
    !finished?
  end
end
