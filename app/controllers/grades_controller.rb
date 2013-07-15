class GradesController < InheritedResources::Base
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    @grades = Grade.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grades }
    end
  end

  private 
  def sort_column
    Grade.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
