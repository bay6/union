class ParticipationsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @participations = params[:project_id].blank? ? Participation : Participation.where(project_id: params[:project_id]).order("created_at DESC")
    @participations = @participations.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participations }
    end
  end
end
