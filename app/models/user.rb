class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rolifications
  has_many :branches, through: :rolifications
  has_many :roles, through: :rolifications

  accepts_nested_attributes_for :rolifications, allow_destroy: true

  validates :name, presence: true
end
