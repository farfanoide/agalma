class RemoveColumns < ActiveRecord::Migration
  def change
   remove_column :branches, :external
  end
end
