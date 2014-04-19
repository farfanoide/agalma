class CreateExternalBranches < ActiveRecord::Migration
  def change
    create_table :external_branches do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :email
      t.integer :zipcode
      t.string :zone

      t.timestamps
    end
  end
end
