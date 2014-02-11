class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,:trackable, :rememberable, :validatable

  has_many :rolifications
  has_many :roles, through: :rolifications
  has_many :branches, through: :rolifications

  accepts_nested_attributes_for :rolifications, allow_destroy: true
  def admin?
    !roles.where('name = ?', 'admin').blank?
  end  
  def can_edit_branch?(branch)
    !rolifications.where('role_id = ? and branch_id = ? ', Role.find_by(name: 'admin').id, branch.id).blank?
  end
end
