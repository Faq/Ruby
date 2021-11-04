class ChartsController < ApplicationController
  def completed_tasks
    data = [['Country', 'Cumulative']] + Stream.where(date: 1.weeks.ago.midnight..Time.now).group(:country).sum(:twoweek_cumulative).map { |country, count| [country, count] }
    render json: data
  end
end
