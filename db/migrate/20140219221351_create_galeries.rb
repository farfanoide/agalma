class CreateGaleries < ActiveRecord::Migration
  def change
    create_table :galeries do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
