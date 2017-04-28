class CreatePicPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :pic_posts do |t|
      t.string :definition
      t.references :post, index: true, foreign_key: true
    end
  end
end
