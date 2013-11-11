class Branch < ActiveRecord::Base
  has_many :rolifications
  has_many :users, through: :rolifications
  has_many :roles, through: :rolifications


  accepts_nested_attributes_for :rolifications

  validates_presence_of :name
end
