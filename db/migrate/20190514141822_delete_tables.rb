class DeleteTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :entries
    drop_table :messages
    drop_table :rooms
  end
end
