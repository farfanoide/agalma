class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.references :branch, index: true
      t.references :page, index: true

      t.timestamps
    end
  end
end
