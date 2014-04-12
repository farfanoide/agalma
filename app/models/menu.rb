class Menu < ActiveRecord::Base
  has_many :pages
  belongs_to :branch

  # TODO: implement menu_policy
  scope :general, -> { where(branch_id: nil) }
  scope :top, ->     { where(position: "top") }
  scope :right, ->   { where(position: "right") }
  scope :bottom, ->  { where(position: "bottom") }
  
  def add_page (page)
    page.menu_id = self.id
    page.position = self.pages.size + 1
  end
  # def sort_menu(argumento) #ToDo modificar nombre variable
  #  @pages = pages
  #  argumento.each do |arg|
  #    @pages.where(id: arg.id).position = arg.position
  #  end
  #  @pages.save
  # end
end
