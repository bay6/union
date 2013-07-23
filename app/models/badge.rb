#encoding: utf-8
class Badge < ActiveRecord::Base
  attr_accessible :description, :name_en, :name_zh

  validates :name_zh, :name_en, :description, :presence => true

  validates :name_zh, :name_en, uniqueness: true

  has_many :attachments, :as => :attachmentable


  def image
    self.attachments.last.attachment.url(:preview)
  end

  def award_info
    "#{self.award_number} 次颁发"
  end
end
