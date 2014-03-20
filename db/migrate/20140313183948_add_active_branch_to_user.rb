class AddActiveBranchToUser < ActiveRecord::Migration
  def change
    add_column :users, :active_branch, :integer
  end
end
