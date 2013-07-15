class Grade < ActiveRecord::Base
  attr_accessible :description, :name, :weights

  validates :name, :weights, :presence => true

  has_many :users

  def self.beginner
    Grade.find_by_weights 2
  end
end
