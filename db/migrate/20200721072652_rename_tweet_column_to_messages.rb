class RenameTweetColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :tweet, :text
  end
end
