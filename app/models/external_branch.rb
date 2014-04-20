class ExternalBranch < ActiveRecord::Base
  has_many :external_telephones

  accepts_nested_attributes_for :external_telephones

  validates_presence_of :name

end
