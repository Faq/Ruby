# COVID-19 cumulative data api with basic CRUD.

This is small ROR learning project where was used [open data source](https://data.gov.lv/dati/lv/dataset/valstu-saslimstibas-raditaji-ar-covid-19/resource/8ea0ee31-1bea-4336-bbe4-2e66ccdadd1b).

To run it:
1. clone repo
2. run
   gem install bundler and bundle install
3.  in config\database.yml edit db connection data
4. to make db table, run:
   rails db:migrate
5. to populate db table with open data, run:
   bundle exec rake db:seed

