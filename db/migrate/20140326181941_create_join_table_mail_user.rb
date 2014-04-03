class CreateJoinTableMailUser < ActiveRecord::Migration
  def change
    create_join_table :mails, :users do |t|
      # t.index [:mail_id, :user_id]
      # t.index [:user_id, :mail_id]
    end
  end
end
