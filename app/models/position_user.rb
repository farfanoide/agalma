class PositionUser < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user
  belongs_to :position
 
  validates_associated :position
  validates_associated :user
  validates_associated :branch
 
end
