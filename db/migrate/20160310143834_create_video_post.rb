class CreateVideoPost < ActiveRecord::Migration[5.1]
  def change
    create_table :video_posts do |t|
      t.string :title
      t.string :link
      t.string :definition
      t.references :post, index: true, foreign_key: true
    end
  end
end
