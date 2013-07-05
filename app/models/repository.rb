class Repository < ActiveRecord::Base
  attr_accessible :avatar_url, :description, :html_url, :name, :starred_url, :uid
  #has_many :commits

  def self.get_bay6_repos
    #FIXME should be DRY
    @client = Octokit::Client.new(:login => "ken0", :password => "password9")
    brepos = @client.repos( 'bay6')
    brepos.each{|repo| self.create_or_update(repo)}
  end

  protected
  def self.create_or_update repo
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
