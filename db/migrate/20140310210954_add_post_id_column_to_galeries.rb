class AddPostIdColumnToGaleries < ActiveRecord::Migration
  def change
    add_column :galeries, :post_id, :integer
  end
end
