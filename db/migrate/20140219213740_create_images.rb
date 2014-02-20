class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :name
      t.references :galery, index: true

      t.timestamps
    end
  end
end
