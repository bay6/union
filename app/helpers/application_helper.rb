module ApplicationHelper
  def joined?(user_id, project_id)
    Participation.where(user_id: user_id, project_id: project_id).blank? ? false : true
  end
end
