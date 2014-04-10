class AddExternalToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :external, :boolean, default: false
  end
end
