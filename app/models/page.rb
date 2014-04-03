class Page < ActiveRecord::Base
  has_many :directions
  has_many :branches, through: :directions
  validates :slug, uniqueness: true, presence: true
  before_validation :slugify

  accepts_nested_attributes_for :directions, allow_destroy: true

  def to_param
    slug
  end

  def slugify
    self.slug ||= title.parameterize
  end
end
