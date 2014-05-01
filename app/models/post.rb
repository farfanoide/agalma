class Post < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user

  mount_uploader :post_image, PostImageUploader

  #  searchable do
  #    text :title, :content
  #  end

  has_one :galery

  validates_presence_of :title, :description

  accepts_nested_attributes_for :galery, allow_destroy: true


end

