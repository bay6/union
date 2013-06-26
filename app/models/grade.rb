class Grade < ActiveRecord::Base
  attr_accessible :description, :name, :weights
end
