class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.integer :ext
      t.integer :num
      t.references :branch, index: true

      t.timestamps
    end
  end
end
