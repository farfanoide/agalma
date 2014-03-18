class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable,:trackable, :rememberable, :validatable
  has_many :rolifications
  has_many :posts
  has_many :roles, through: :rolifications
  has_many :branches, through: :rolifications
  accepts_nested_attributes_for :rolifications, allow_destroy: true
  mount_uploader :avatar, AvatarUploader

  def admin?
    admin
  end

  def user_roles(branch)
    Rolification.where(branch_id: branch.id).where(user_id: self.id).map{ |r| r.role.name }
  end

  def has_backend_role?
    Rolification.where(user_id: self.id).map{ |r| r.role.name }.any?
  end

  def can_edit_branch?(branch)
    user_roles(branch).include?('moderador')
  end

  def can_manage_post?(post)
    user_roles(post.branch).include?('moderador')
  end

  def has_many_branches?
    branches.size > 1
  end
end
