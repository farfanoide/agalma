class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :subject
      t.text :body
      t.references :sender, index: true
      t.timestamps
    end
  end
end
