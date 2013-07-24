#encoding: utf-8
class ActivitiesController < InheritedResources::Base
  actions :all, except: [:destroy]
  authorize_resource only: [:new, :create, :update, :edit]
  load_resource

  def register
    if current_user
      @activity.users << current_user
      @activity.save
      redirect_to :back, notice: "报名成功"
    else
      redirect_to :back, alert: "请先登录再报名"
    end
  end
end
