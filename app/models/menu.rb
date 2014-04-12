class Menu < ActiveRecord::Base
  has_many :pages
  belongs_to :branch

  # TODO: implement menu_policy
  scope :general, -> { where(branch_id: nil) }
  scope :dedicated, -> { where.not(branch_id: nil) }
  scope :top, ->     { where(position: "top") }
  scope :right, ->   { where(position: "right") }
  scope :bottom, ->  { where(position: "bottom") }

  def add_page(page)
    page.menu_id = self.id
    page.position = self.pages.size + 1
  end

  def general?
    !branch_id
  end

end

