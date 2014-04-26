class AddPublicToGaleries < ActiveRecord::Migration
  def change
    add_column :galeries, :public, :boolean, :default => true
  end
end
