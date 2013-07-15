class ProjectsController < InheritedResources::Base
  load_and_authorize_resource :except => [:ongoing]

  def index
    #@projects = Project.cached_all_projects
    @projects = params[:grade_id] ? Project.where(grade_id: params[:grade_id]) : Project
    @projects = @projects.includes(:grade, :user).order("grade_id ASC, status DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def ongoing
    #@projects = Project.cached_ongoing_projects
    @projects = Project.where(status: Project::ONGOING).
      where("projects.name like :query", query: "%#{ params[:q] }%").includes(:grade, :user).order("grades.weights ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def join
    @project = Project.find(params[:id])
    Participation.find_or_create_by_project_id_and_user_id!(@project.id, current_user.id)
    redirect_to :back
  end

  def quit
    @project = Project.find(params[:id])
    @project.participations.where(user_id: current_user.id).destroy_all
    redirect_to :back
  end

  def finish
    @project = Project.find(params[:id])
    @participations = @project.participations.where(user_id: current_user.id)
    #TODO change weights to method should not hard code for weights here
    if @project.grade.weights == 1
      current_user.auto_graduate @participations
    else
      @participations.each {|p| p.update_attributes(:status => Participation::REQUESTED) }
    end
    redirect_to :back
  end
end
