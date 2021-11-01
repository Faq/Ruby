class CreateStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :streams do |t|
      t.datetime :date
      t.string :country
      t.float :twoweek_cumulative
      t.string :departure
      t.string :self_isolation

      t.timestamps
    end
  end
end
