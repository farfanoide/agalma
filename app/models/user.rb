class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
    :recoverable,:trackable, :rememberable, :validatable

  has_many :posts
  has_and_belongs_to_many :roles
  has_many :position_users
  has_many :branches
  has_many :positions, through: :position_users

  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :position_users, allow_destroy: true
  mount_uploader :avatar, AvatarUploader
  mount_uploader :curriculum, FilesUploader

  # TODO: add last name to users
  def full_name
    # TODO: update method -> "${name}, ${last_name}"
    name
  end

  def admin?
    user_roles.include?('admin')
  end

  def user_roles
    roles.all.map{ |r| r.name }
  end

  def has_backend_role?
    user_roles.include?('admin') || user_roles.include?('moderador')
  end

  def professional?
    user_roles.include?('profesional')
  end

  def can_edit_branch?
    user_roles.include?('moderador')
  end

  def can_manage_post?(post)
    user_roles.include?('moderador')
  end

end
