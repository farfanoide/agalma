class ReanameColumnMetodNameToMethodName < ActiveRecord::Migration
  def change
    rename_column :widgets, :metod_name, :method_name
  end
end
