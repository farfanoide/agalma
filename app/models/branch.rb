class Branch < ActiveRecord::Base
  has_many :rolifications
  has_many :users, through: :rolifications
  has_many :roles, through: :rolifications
  has_many :telephones

  accepts_nested_attributes_for :rolifications, allow_destroy: true
  accepts_nested_attributes_for :telephones, allow_destroy: true

  validates_presence_of :name
end
