class User < ActiveRecord::Base
  has_many :rolifications
  has_many :branches, through: :rolifications
  has_many :roles, through: :rolifications

  accepts_nested_attributes_for :rolifications, allow_destroy: true

  validates :name, presence: true
end
