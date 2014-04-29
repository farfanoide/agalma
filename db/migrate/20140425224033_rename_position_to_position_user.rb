class RenamePositionToPositionUser < ActiveRecord::Migration
  def change
    rename_table 'positions', 'position_users'
  end
end
