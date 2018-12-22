class AddImageToTatoo < ActiveRecord::Migration[5.0]
  def up
    add_attachment :tatoos, :image
  end

  def down
    remove_attachment :tatoos, :image
  end
end
