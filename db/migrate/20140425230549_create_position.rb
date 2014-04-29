class CreatePosition < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
    end
  end
end
