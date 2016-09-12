class AddImageColumnsToPets < ActiveRecord::Migration[5.0]
  def up
    add_attachment :pets, :image
  end

  def down
    remove_attachment :pets, :image
  end
end
