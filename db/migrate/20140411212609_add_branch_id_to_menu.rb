class AddBranchIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :branch_id, :integer
  end
end
