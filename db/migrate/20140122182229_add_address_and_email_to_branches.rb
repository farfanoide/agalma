class AddAddressAndEmailToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :address, :string
    add_column :branches, :email, :string
  end
end
