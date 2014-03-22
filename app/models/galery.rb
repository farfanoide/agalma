class Galery < ActiveRecord::Base


belongs_to :post
has_many :images
accepts_nested_attributes_for :images, allow_destroy: true

validates_presence_of :name
end
