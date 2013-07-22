class BadgesController < InheritedResources::Base
  load_and_authorize_resource

  def show
  	@badge = Badge.where(:name_en => params[:name_en]).first
  	redirect_to badges_path unless @badge
  end
end
