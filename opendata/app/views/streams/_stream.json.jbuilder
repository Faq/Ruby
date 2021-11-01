json.extract! stream, :id, :date, :country, :twoweek_cumulative, :departure, :self_isolation, :created_at, :updated_at
json.url stream_url(stream, format: :json)
