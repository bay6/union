class ParticipationsController < ApplicationController
  load_and_authorize_resource
  # GET /participations
  # GET /participations.json
  def index
    @participations = params[:project_id].blank? ? Participation : Participation.where(project_id: params[:project_id]).order("created_at DESC")
    @participations = @participations.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participations }
    end
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
    @participation = Participation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participation }
    end
  end

  # GET /participations/new
  # GET /participations/new.json
  def new
    @participation = Participation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @participation }
    end
  end

  # GET /participations/1/edit
  def edit
    @participation = Participation.find(params[:id])
  end

  # POST /participations
  # POST /participations.json
  def create
    @participation = Participation.new(params[:participation])

    respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation, notice: 'Participation was successfully created.' }
        format.json { render json: @participation, status: :created, location: @participation }
      else
        format.html { render action: "new" }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /participations/1
  # PUT /participations/1.json
  def update
    @participation = Participation.find(params[:id])

    respond_to do |format|
      if @participation.update_attributes(params[:participation])
        format.html { redirect_to :back, notice: 'Participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy

    respond_to do |format|
      format.html { redirect_to participations_url }
      format.json { head :no_content }
    end
  end
end
