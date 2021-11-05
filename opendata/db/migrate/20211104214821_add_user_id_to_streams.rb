class AddUserIdToStreams < ActiveRecord::Migration[6.1]
  def change
    add_column :streams, :user_id, :integer
    add_index :streams, :user_id
  end
end
