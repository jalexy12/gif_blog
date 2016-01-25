class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :gif_url
      t.integer :vote_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
