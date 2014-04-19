class Menu < ActiveRecord::Base
  has_many :pages
  belongs_to :branch

  accepts_nested_attributes_for :pages, allow_destroy: true

  # TODO: implement menu_policy
  scope :general, -> { where(branch_id: nil) }
  scope :dedicated, -> { where.not(branch_id: nil) }
  scope :top, ->     { where(position: "top") }
  scope :right, ->   { where(position: "right") }
  scope :bottom, ->  { where(position: "bottom") }

  def add_page(page)
    page.menu_id = self.id
    page.position = self.pages.size + 1
    page.active = true
  end

  def add_pages(pages = [])
    position = self.pages.size + 1
    pages.each do |page|
      page.branch  = self.branch
      page.menu_id = self.id
      page.position = position
      page.save if page.valid?
      position += 1
    end
  end

  def general?
    !branch_id
  end

end

