class Direction < ActiveRecord::Base
  belongs_to :branch
  belongs_to :page
end
