class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :category
end
