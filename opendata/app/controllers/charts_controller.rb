class ChartsController < ApplicationController
  def area_chart_tasks
    area_data = Stream.group_by_day(:date).sum(:twoweek_cumulative)
    render json: area_data
  end

  def geo_chart_tasks
    geo_data = [['Country', 'Cumulative']] + Stream.where(date: 1.weeks.ago.midnight..Time.now).group(:country).sum(:twoweek_cumulative).map { |country, count| [country, count] }
    render json: geo_data
  end
end
