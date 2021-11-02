# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://data.gov.lv/dati/dataset/5d0c9a64-b7b2-494e-b77d-22d48225791b/resource/8ea0ee31-1bea-4336-bbe4-2e66ccdadd1b/download/covid_19_valstu_saslimstibas_raditaji.csv'
CSV.foreach(Rails.root.join(URI.parse(url).open), row_sep: :auto, headers: :first_row, col_sep: ';') do |row|
  Stream.create({
                  date: row[0],
                  country: row["Valsts"],
                  twoweek_cumulative: row["14DienuKumulativaIncidence"],
                  departure: row["Izcelosana"],
                  self_isolation: row["Pasizolacija"]
                })
end
