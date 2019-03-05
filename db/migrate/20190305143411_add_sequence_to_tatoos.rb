class AddSequenceToTatoos < ActiveRecord::Migration[5.0]
  def change
    add_column :tatoos, :sequence, :integer, default: 0
  end
end
