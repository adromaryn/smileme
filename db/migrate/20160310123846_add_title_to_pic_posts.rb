class AddTitleToPicPosts < ActiveRecord::Migration
  def change
    add_column :pic_posts, :title, :string
  end
end
