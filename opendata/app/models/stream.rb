class Stream < ApplicationRecord
  belongs_to :user

  def self.by_country(country)
    result = all

    result = result.where('country ilike ?', "%#{country}%") if country.present?

    result
  end

  def self.by_date(from_date, to_date)
    result = all

    result = result.where('date >= ?', from_date) if from_date.present?
    result = result.where('date <= ?', to_date) if to_date.present?

    result
  end

  validates :date, presence: true
  validates :country, length: { minimum: 3 }, format: { with: /[a-zA-Z]/ }
  validates :twoweek_cumulative, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :departure, :self_isolation, allow_blank: true, format: { with: /[a-zA-Z]/ }

end
