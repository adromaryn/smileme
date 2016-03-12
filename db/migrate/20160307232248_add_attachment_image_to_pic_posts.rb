class AddAttachmentImageToPicPosts < ActiveRecord::Migration
  def self.up
    change_table :pic_posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pic_posts, :image
  end
end
