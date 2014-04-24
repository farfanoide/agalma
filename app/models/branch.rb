class Branch < ActiveRecord::Base
  has_many :rolifications
  has_many :posts
  has_many :users, through: :rolifications
  has_many :roles, through: :rolifications
  has_many :telephones
  has_many :pages
  has_and_belongs_to_many :external_branches
  has_one :menu
  accepts_nested_attributes_for :rolifications, allow_destroy: true
  accepts_nested_attributes_for :telephones, allow_destroy: true
  accepts_nested_attributes_for :posts, allow_destroy: true

  validates_presence_of :name

  #  searchable do
  #    text :name
  #  end

#  scope :external, -> { where(external: true) }
 # scope :internal, -> { where(external: false) }

  class << self
    def default_branch
      last
    end
  end
end

