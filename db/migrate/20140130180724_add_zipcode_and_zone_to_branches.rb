class AddZipcodeAndZoneToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :zipcode, :integer
    add_column :branches, :zone, :string
  end
end
