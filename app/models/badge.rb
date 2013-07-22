class Badge < ActiveRecord::Base
  attr_accessible :description, :name_en, :name_zh

  validates :name_zh, :name_en, :description, :presence => true
end
