class Role < ActiveRecord::Base
  has_many :rolifications
  has_many :branches, through: :rolifications
  has_many :users, through: :rolifications

  accepts_nested_attributes_for :rolifications, allow_destroy: true
end
