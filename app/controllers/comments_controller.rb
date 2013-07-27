class CommentsController < ApplicationController

  def create
    @activity = Activity.find(params[:activity_id])
    @comment = @activity.comments.build(params[:comment])
    @comment.user_id = current_user.id

    @comment.save
  end

  def preview
    @comment = Comment.new(params[:comment])
    render :layout => false
  end

end
