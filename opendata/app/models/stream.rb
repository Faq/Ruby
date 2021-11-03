class Stream < ApplicationRecord
  scope :country, ->(query) { where('country ilike ?', "%#{query}%") }

  def self.by_date(from_date, to_date)
    result = all

    result = result.where('date >= ?', from_date) if from_date.present?
    result = result.where('date <= ?', to_date) if to_date.present?

    result
  end
end
