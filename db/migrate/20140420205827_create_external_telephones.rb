class CreateExternalTelephones < ActiveRecord::Migration
  def change
    create_table :external_telephones do |t|
      t.integer :ext
      t.integer :num
      t.references :external_branch, index: true

      t.timestamps
    end
  end
end
