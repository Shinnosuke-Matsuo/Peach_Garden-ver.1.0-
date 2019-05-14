class AddIndexToMessage < ActiveRecord::Migration[5.2]
  def change
    add_index :messages, [:room_id, :created_at]
  end
end
