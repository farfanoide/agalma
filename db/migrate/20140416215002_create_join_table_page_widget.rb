class CreateJoinTablePageWidget < ActiveRecord::Migration
  def change
    create_join_table :pages, :widgets do |t|
      # t.index [:page_id, :widget_id]
      # t.index [:widget_id, :page_id]
    end
  end
end
