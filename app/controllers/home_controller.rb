#encoding: utf-8
class HomeController < ApplicationController
  def index
    @user = current_user
    @my_ongoing_projects = @user.ongoing_projects.order("created_at DESC").last(3)
    @recommend_projects = (Project.where(status: Project::ONGOING, grade_id: @user.grade_id).order("created_at DESC") - @user.ongoing_projects - @user.finished_projects).last(3)
  end

  def union_report
    this_month_commit_details = Commit.this_month_commit_details
    @this_month_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text=>"历史趋势图"})
      f.subtitle({:text=>'本月每日提交统计详情'})
      f.options[:xAxis][:categories] = this_month_commit_details[0]
      f.series(:type=> 'spline',:name=> 'commits', :data=> this_month_commit_details[1])
     end

    @count_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({:text=>"历史统计"})
      f.options[:xAxis][:categories] = ['工会总成长值', '本月成长值','本周成长']
      f.series(:type=> 'column', :name=> 'commits',:data=> [Commit.all_exp.to_i, this_month_commit_details[1].sum, Commit.week_exp.to_i])
     end
  end

  def instruction
  end
end
