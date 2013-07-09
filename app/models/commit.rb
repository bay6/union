class Commit < ActiveRecord::Base
  attr_accessible :author_date, :author_email, :author_name, :commit_date, :committer_email, :committer_name, :html_url, :repository_id, :sha, :repository, :user_uid
  belongs_to :repository

  extend OctokitExtention

  class << self
    #also would like a average grow
    def month_exp
      where('commit_date >= :month', month: Date.today.at_beginning_of_month).count.to_s
    end

    def week_exp
      where('commit_date >= :week', week: Date.today.at_beginning_of_week).count.to_s
    end

    def all_exp
      count.to_s
    end
  end

  def self.fetch_bay6
    @client = authenticated_api 
    @client.repos('bay6').each{|x| Commit.get_commit_from x}
  end

  def self.get_commit_from repo
    @client = authenticated_api 
    all_commits = []
    commits = Array.new(100)
    last_commit =  @client.commits("#{repo.owner.login}/#{repo.name}").first
    begin
      commits = @client.commits("#{repo.owner.login}/#{repo.name}", 'master', {per_page: 100, sha: last_commit.sha})
      binding.pry
      last_commit = commits.last
      all_commits += commits
    end until commits.count < 100
    all_commits.each{|commit| create_or_update(commit, repo)}
  end

  protected
  def self.create_or_update commit, repo
    local_commit = Commit.find_or_create_by_sha commit.sha
    user_uid = commit.author.try(:id) || commit.committer.try(:id)
    local_commit.update_attributes(
      user_uid: user_uid,
      author_date: commit.commit.author.date,
      author_email: commit.commit.author.email,
      author_name: commit.commit.author.name,
      commit_date: commit.commit.committer.date,
      committer_email: commit.commit.author.email,
      committer_name: commit.commit.author.name,
      html_url: commit.html_url,
      repository: Repository.find_by_uid(repo.id)#should be project_id
    )
  end
end
