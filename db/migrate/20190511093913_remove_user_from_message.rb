class RemoveUserFromMessage < ActiveRecord::Migration[5.2]
  def change
    # remove_foreign_key :messages, column: :user
    # remove_reference :messages, :user, foreign_key: true
    # remove_foreign_key :messages, column: :room
    # remove_reference :messages, :room, foreign_key: true
  end
end
