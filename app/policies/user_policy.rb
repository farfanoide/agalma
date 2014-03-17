class UserPolicy < Struct.new(:user, :scope)
  def admin?
    user.admin?
  end
end
