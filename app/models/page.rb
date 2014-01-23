class Page < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true
  before_validation :slugify

  def to_param
    slug
  end

  def slugify
    self.slug ||= title.parameterize
  end
end
