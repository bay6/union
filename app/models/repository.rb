class Repository < ActiveRecord::Base
  attr_accessible :avatar_url, :description, :html_url, :name, :starred_url, :uid
end
