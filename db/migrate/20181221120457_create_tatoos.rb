class CreateTatoos < ActiveRecord::Migration[5.0]
  def change
    create_table :tatoos do |t|
      t.boolean :premium

      t.timestamps
    end
  end
end
