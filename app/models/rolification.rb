class Rolification < ActiveRecord::Base
  belongs_to :branch
  belongs_to :role
  belongs_to :user

  validates_associated :role
  validates_associated :user
  validates_associated :branch
  validates_uniqueness_of :role, scope: [:user, :branch]

  after_save :set_active_branch_to_user

  def set_active_branch_to_user
    self.user.active_branch = self.branch.id
    self.user.save!
  end
end
