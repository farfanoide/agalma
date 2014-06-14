class UserPolicy < Struct.new(:currentuser, :user)
  # devuelve si el user es admin
  # TODO cambiar nombre a las variables
  class Scope < Struct.new(:currentuser, :scope)
    def resolve
      if currentuser.admin?
        scope.all
      end
    end
  end

  def admin?
    currentuser.admin?
  end

  def create?
    currentuser.admin?
  end

  def edit?
    currentuser.admin? || my_user?
  end

  def destroy?
    currentuser.admin?
  end

  def index?
    currentuser.admin?
  end

  def my_user?
    true if currentuser.id==user.id
  end

  def show?
    currentuser.admin? || my_user?
  end

end
