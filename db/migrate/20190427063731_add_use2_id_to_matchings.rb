class AddUse2IdToMatchings < ActiveRecord::Migration[5.2]
  def change
    add_column :matchings, :user2_id, :integer
  end
end
