#encoding: utf-8
module RecordsHelper
  def first_commit_date user 
    first_commit = user.records.order("commit_date").first
    first_commit.nil?? '不存在' : first_commit.commit_date
  end
end
