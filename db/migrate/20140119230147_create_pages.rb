class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :active

      t.timestamps
    end
    add_index :pages, :slug
  end
end
