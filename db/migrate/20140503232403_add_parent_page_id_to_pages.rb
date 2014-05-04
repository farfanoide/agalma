class AddParentPageIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :parent_page_id, :integer
  end
end
