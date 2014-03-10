class Post < ActiveRecord::Base
  belongs_to :branch
  # belongs_to :user
  has_many :galeries

  accepts_nested_attributes_for :galeries, allow_destroy: true
end
