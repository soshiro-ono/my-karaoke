class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.references :user,null: false,foreign_key: true
      t.string :title,null: false
      t.string :artist,null: false
      # t.integer :genre_id, null: false
      t.text :memo
      t.timestamps
    end
  end
end
