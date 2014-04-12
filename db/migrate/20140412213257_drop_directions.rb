class DropDirections < ActiveRecord::Migration
  def up
    drop_table :directions
  end
  def down
    create_table :directions do |t|
      t.references :branch, index: true
      t.references :page, index: true

      t.timestamps
    end
  end
end
