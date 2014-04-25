class Position < ActiveRecord::Base
  has_many :position_users
  has_many :branches, through: :position_users
  has_many :users, through: :position_users

  accepts_nested_attributes_for :position_users, allow_destroy: true
end
