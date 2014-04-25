class Branch < ActiveRecord::Base
  has_many :rolifications
  has_many :posts
  has_many :users, through: :rolifications
  has_many :roles, through: :rolifications
  has_many :telephones
  has_many :pages
  has_many :positions
  has_and_belongs_to_many :external_branches
  has_one :menu
  accepts_nested_attributes_for :rolifications, allow_destroy: true
  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :posts, allow_destroy: true
  accepts_nested_attributes_for :positions, allow_destroy: true

  validates_presence_of :name

  def zone_data
     "#{self.zone} (#{self.zipcode})"
  end

  def self.default_branch
    first
  end
end

