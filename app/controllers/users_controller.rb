#encoding: utf-8
class UsersController < ApplicationController
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
      f.series(:type=> 'column', :name=> 'Value',:data=> last_7_days_commit)
    end
  end

  def update
    @user = User.find(params[:id])
    redirect_to :users, notice: "User was successfully updated " if @user.update_attributes! params[:user]
  end

  private

  def last_7_days
    @last_7_days = []
    7.times do |n|
      @last_7_days << (Date.today - n -1 ).strftime("%m/%d/%Y")
    end
    @last_7_days.reverse
  end

  def last_7_days_commit
    records = @user.records.where(commit_date: Date.today-8..Date.today-1)
    @last_7_days_commit = []
    a = {}

    if records.count == 0
      @last_7_days_commit = Array.new(7) {|index| index = 0}
    else
      records.each do |record|
        a.merge! record.commit_date.strftime("%m/%d/%Y") => record.value
      end
      last_7_days.each do |day|
        if a.has_key? day
          @last_7_days_commit << a[day]
        else
          @last_7_days_commit << 0
        end
      end
    end
    @last_7_days_commit
  end
end
