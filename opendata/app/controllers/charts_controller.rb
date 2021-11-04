class ChartsController < ApplicationController
  def completed_tasks
    render json: Stream.group(:country).group_by_day(:date, range: 1.weeks.ago.midnight..Time.now).sum(:twoweek_cumulative)
  end
end
