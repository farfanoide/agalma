class AddBranchIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :branch_id, :integer
  end
end
