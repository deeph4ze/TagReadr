class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :user
      t.text :tweet
      t.text :url
      t.text :tags

      t.timestamps
    end
  end
end
