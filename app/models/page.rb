class Page < ActiveRecord::Base
  belongs_to :branch
  belongs_to :menu
  has_and_belongs_to_many :widgets

  validates :slug, uniqueness: true, presence: true
  before_validation :slugify

  scope :general, -> { where(branch_id: nil) }

  def slugify
    self.slug ||= title.parameterize
  end

  def to_param
    slug
  end
end
