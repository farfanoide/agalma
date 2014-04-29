class AddCurriculumAndProfessionAndTitlesToUser < ActiveRecord::Migration
  def change
    add_column :users, :curriculum, :string
    add_column :users, :profession, :string
    add_column :users, :titles, :text
  end
end
