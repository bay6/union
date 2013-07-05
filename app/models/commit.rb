class Commit < ActiveRecord::Base
  attr_accessible :author_date, :author_email, :author_name, :commit_date, :committer_email, :committer_name, :html_url, :repository_id, :sha
end
