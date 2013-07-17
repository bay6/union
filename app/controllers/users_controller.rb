#encoding: utf-8
class UsersController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    @users = User.page params[:page]
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find(params[:id])

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"个人成长变化曲线图"})
      f.xAxis(:categories => last_7_days)
      f.series(:type=> 'column', :name=> '得分',:data=> last_7_days_commit)
    end
  end

  def update
    @user = User.find(params[:id])
    redirect_to :users, notice: "User was successfully updated " if @user.update_attributes! params[:user]
  end

  private

  def last_7_days
    min = Date.today - 8
    (min..(min+7)).to_a
  end

  def last_7_days_commit
    records = @user.records.where(commit_date: Date.today-8..Date.today-1)
    a = {}

    records.each {|record| a.merge! record.commit_date => record.value }
    last_7_days.map {|d| a[d] || 0}
  end
end
