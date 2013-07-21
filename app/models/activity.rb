class Activity < ActiveRecord::Base
  attr_accessible :description, :start_at, :summary, :title, :status

  has_and_belongs_to_many :users

  STATUS = {
    0 => "准备中",
    1 => "报名中",
    2 => "已结束"
  }

  def human_status
    STATUS[status||0]
  end

  def has_registered(user)
    user && users.include?(user)
  end

  # change status to 准备中
  def to_prepare
    self.status = 0
  end

  # change status to 报名中
  def to_going
    self.status = 1
  end

  # change status to 已结束
  def to_complete
    self.status = 2
  end
  
  def perpare?
    self.status == 0
  end

  def going?
    self.status == 1
  end

  def completed?
    self.status == 2
  end
end
