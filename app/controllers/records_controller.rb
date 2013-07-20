class RecordsController < InheritedResources::Base
  load_and_authorize_resource except: [:ranking]
  helper_method :sort_column,:sort_direction

  def index
    @records = params[:user_id].blank? ? Record: Record.where(user_id: params[:user_id])
    @records = params[:commit_date].blank? ? @records: @records.where(commit_date: params[:commit_date])
    @records = @records.unscoped.order(sort_column + " " + sort_direction).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @records }
    end
  end

  private
  def sort_column
    Record.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
