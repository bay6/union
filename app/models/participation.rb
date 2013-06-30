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

  validates :project_id, :user_id, :role, :presence => true
end
