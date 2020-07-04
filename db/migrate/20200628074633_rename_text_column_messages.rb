class RenameTextColumnMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :text, :tweet
  end
end
