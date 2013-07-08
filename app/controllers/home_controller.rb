class HomeController < ApplicationController
  def index
    @user = current_user
    @my_ongoing_projects = @user.ongoing_projects.order("created_at DESC").last(3)
    @recommend_projects = (Project.where(status: Project::ONGOING, grade_id: @user.grade_id).order("created_at DESC") - @user.ongoing_projects - @user.finished_projects).last(3)
  end

  def union_report
  end
end
