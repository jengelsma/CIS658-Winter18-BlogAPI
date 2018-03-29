class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :article
      t.integer :likes
      t.integer :status

      t.timestamps
    end
  end
end
