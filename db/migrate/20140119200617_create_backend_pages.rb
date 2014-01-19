class CreateBackendPages < ActiveRecord::Migration
  def change
    create_table :backend_pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :active

      t.timestamps
    end
    add_index :backend_pages, :slug
  end
end
