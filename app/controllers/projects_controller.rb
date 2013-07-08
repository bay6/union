class ProjectsController < ApplicationController
  load_and_authorize_resource :except => [:ongoing]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.cached_all_projects
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def ongoing
    #@projects = Project.cached_ongoing_projects
    @projects = Project.where(status: Project::ONGOING).includes(:grade, :user).order("Grade_id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new(:status => Project::GRADING)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save and @project.create_default_participation
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
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
    @projects = @project.participations.where(user_id: current_user.id)
    @projects.each {|p| p.update_attributes(:status => Participation::FINISHED) }
    redirect_to :back
  end
end
