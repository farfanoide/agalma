class Page < ActiveRecord::Base
  belongs_to :branch
  belongs_to :menu
  has_and_belongs_to_many :widgets
  has_many :child_pages, class_name: 'Page', foreign_key: 'parent_page_id'
  belongs_to :parent_page, class_name: 'Page'

  validates :slug, uniqueness: true, presence: true
  before_validation :slugify

  scope :general, -> { where(branch_id: nil) }
  scope :active, -> { where(active: true) }

  def slugify
    self.slug ||= title.parameterize
  end

  def to_param
    slug
  end

  def general?
    !branch_id
  end
end
