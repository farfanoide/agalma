class Post < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user

  searchable do
    text :title, :content
  end

  has_one :galery

  validates_presence_of :title

  accepts_nested_attributes_for :galery, allow_destroy: true


end

