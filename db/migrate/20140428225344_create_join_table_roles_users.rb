require_relative '20131110215122_create_rolifications.rb'
class CreateJoinTableRolesUsers < ActiveRecord::Migration
  def change
    revert CreateRolifications
    
    create_join_table :roles, :users do |t|
      # t.index [:role_id, :user_id]
      # t.index [:user_id, :role_id]
    end
  end
end
