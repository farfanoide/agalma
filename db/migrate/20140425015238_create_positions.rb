class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :branch, index: true
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
