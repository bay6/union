class BadgeUsers < ActiveRecord::Base
  attr_accessible :content, :badge_id, :user_id, :user, :badge

  validates :badge_id, :user_id, :presence => true
  validates_uniqueness_of :badge_id, :scope => [:user_id]

  belongs_to :user
  belongs_to :badge

  after_create :set_badge_award_number, :set_user_notice_and_message

  protected

  def set_badge_award_number
    self.badge.award_number += 1
    self.badge.save!
  end

  def set_user_notice_and_message
    notice = Notice.new
    notice.title = '系统消息'
    notice.content = "尊敬的工会成员你好，你在#{Time.now.to_s(:db)},获得<#{self.badge.name_zh}> 徽章一枚. "
    notice.user = self.user
    notice.save!

    message = Message.new
    message.status = Message::UNREAD
    message.notice = notice
    message.user = notice.user
    message.save!
  end
end
