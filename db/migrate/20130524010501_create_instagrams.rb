class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.text :user
      t.text :image_url
      t.text :comment
      t.text :tags

      t.timestamps
    end
  end
end
