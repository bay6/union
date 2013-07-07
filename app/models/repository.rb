class Repository < ActiveRecord::Base
  attr_accessible :avatar_url, :description, :html_url, :name, :starred_url, :uid, :project_id
  has_many :commits
  belongs_to :project

  extend OctokitExtention

  class << self

    def get_bay6_repos
      @client = authenticated_api
      brepos = @client.repos( 'bay6')
      brepos.each{|repo| self.create_or_update(repo)}
    end

    protected
    def create_or_update repo
      proj = Repository.find_or_create_by_uid(repo.id)
      proj.update_attributes(
        uid: repo.id,
        name: repo.name,
        avatar_url: repo.owner.avatar_url,
        description: repo.description,
        html_url: repo.html_url,
        starred_url: repo.owner.starred_url
      )
    end
  end
end
