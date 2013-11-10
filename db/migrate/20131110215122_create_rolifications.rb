class CreateRolifications < ActiveRecord::Migration
  def change
    create_table :rolifications do |t|
      t.references :branch, index: true
      t.references :role, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
