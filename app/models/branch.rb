class Branch < ActiveRecord::Base
  has_many :rolifications
  has_many :posts
  has_many :users, through: :rolifications
  has_many :roles, through: :rolifications
  has_many :telephones
  has_many :directions
  has_many :pages, through: :directions

  accepts_nested_attributes_for :rolifications, allow_destroy: true
  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :posts, allow_destroy: true

  validates_presence_of :name
end
