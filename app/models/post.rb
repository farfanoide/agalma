class Post < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user
end
