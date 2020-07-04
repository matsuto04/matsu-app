class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.string :image
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
