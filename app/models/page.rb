class Page < ActiveRecord::Base
  has_many :branches, through: :directions
  has_many :directions
  belongs_to :menu

  validates :slug, uniqueness: true, presence: true
  before_validation :slugify

  accepts_nested_attributes_for :directions, allow_destroy: true

  def slugify
    self.slug ||= title.parameterize
  end

  def to_param
    slug
  end
end
