class Mail < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  has_many :'mails_users'
  has_many :receivers, through: :'mails_users', class_name: 'User'
end
