class HomeController < ApplicationController
  def index
    @projects = Project.order("created_at DESC").last(6)
    @user = current_user
  end

  def union_report
  end
end
