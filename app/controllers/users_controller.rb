class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@users = User.without_user(current_user).page(params[:page]).per(30)
    @users = User.page params[:page]
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to :users, notice: "User was successfully updated " if @user.update_attributes! params[:user]
  end

end
