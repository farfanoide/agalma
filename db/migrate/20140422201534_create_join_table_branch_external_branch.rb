class CreateJoinTableBranchExternalBranch < ActiveRecord::Migration
  def change
    create_join_table :branches, :external_branches do |t|
      # t.index [:branch_id, :external_branch_id]
      # t.index [:external_branch_id, :branch_id]
    end
  end
end
