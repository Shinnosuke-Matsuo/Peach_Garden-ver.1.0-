class RenameTopicIdColumnToMatchings < ActiveRecord::Migration[5.2]
  def change
    rename_column :matchings, :topic_id, :micropost_id
  end
end
