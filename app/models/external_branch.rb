class ExternalBranch < ActiveRecord::Base
  has_many :external_telephones
  has_and_belongs_to_many :branches

  accepts_nested_attributes_for :external_telephones
  validates_presence_of :name

end
