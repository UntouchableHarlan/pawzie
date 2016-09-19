class AddImagesToPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :image, :string
  end
  def up
    add_attachment :posts, :image
  end

  def down
    remove_attachment :posts, :image
  end
end
