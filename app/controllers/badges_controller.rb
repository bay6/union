class BadgesController < InheritedResources::Base
  load_and_authorize_resource

  def show
  	@badge = Badge.where(:name_en => params[:name_en]).first
  	redirect_to badges_path unless @badge
  end

  def create
    if @badge.save
       Attachment.create(:attachment => params[:attachment], :attachmentable => @badge) if params[:attachment]
       redirect_to badges_path, notice: 'badge was successfully created.'
    else
      render action: 'new'
    end

  end
end
