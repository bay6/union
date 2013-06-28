class Grade < ActiveRecord::Base
  attr_accessible :description, :name, :weights

  validates :name, :weights, :presence => true
end
