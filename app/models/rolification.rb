class Rolification < ActiveRecord::Base
  belongs_to :branch
  belongs_to :role
  belongs_to :user
end
