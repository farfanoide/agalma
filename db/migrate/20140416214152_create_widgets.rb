class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :description
      t.string :cell_class
      t.string :metod_name

      t.timestamps
    end
  end
end
