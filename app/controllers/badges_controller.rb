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

  def load_award_modal
    respond_to do |format|
      format.js
    end
  end

  def award
    badge = Badge.find(params[:badge_id])
    redirect_to badges_path, :notice => 'Award faild with some error.' unless badge
    params[:users].each  do |id|
      user = User.find(id)
      BadgeUsers.create(:badge => badge, :user=> user)
    end
    redirect_to badges_path, :notice => 'Award successfully.'
  end

  def users
    render json: @users
  end

end
