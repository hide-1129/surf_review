class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :surf_spot
      t.text :review
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
