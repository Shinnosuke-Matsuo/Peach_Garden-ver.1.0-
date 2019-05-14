class AddFromIdToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :from_id, :integer
    add_column :messages, :to_id, :integer
    add_column :messages, :room_id, :string
  end

end
