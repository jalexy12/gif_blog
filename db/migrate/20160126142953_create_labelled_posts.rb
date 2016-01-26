class CreateLabelledPosts < ActiveRecord::Migration
  def change
    create_table :labelled_posts do |t|
      t.references :post, index: true, foreign_key: true
      t.references :label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
