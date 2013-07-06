module ApplicationHelper
  def joined?(user_id, project_id)
    Participation.where(user_id: user_id, project_id: project_id).blank? ? false : true
  end

  def ongoing? project_id
    @ongoing ||= (Project.find(project_id).status == 'ongoing' ? true : false)
  end
end
