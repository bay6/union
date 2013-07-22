class CommentsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @comment = @activity.comments.build(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to activity_path(@activity), :notice => "发布评论成功"
    end
  end
end
