class Post < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user

  searchable do
    text :title, :content
  end
end
