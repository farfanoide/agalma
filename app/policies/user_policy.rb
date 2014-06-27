class UserPolicy < Struct.new(:user, :resource)
  # devuelve si el user es admin
  # TODO cambiar nombre a las variables
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def admin?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin? || my_user?
  end

  def destroy?
    user.admin?
  end

  def index?
    user.admin?
  end

  def my_user?
    true if user.id == resource.id
  end

  def show?
    user.admin? || my_user?
  end

end
