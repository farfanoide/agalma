class Post < ActiveRecord::Base
  belongs_to :branch

  belongs_to :user
  has_one :galery


  accepts_nested_attributes_for :galery, allow_destroy: true

end
