class AddTitleToPicPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :pic_posts, :title, :string
  end
end
