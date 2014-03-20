class UserPolicy < Struct.new(:user, :scope)
  # devuelve si el user es admin
  def admin?
    user.admin?
  end

  # metodos que checkean el ABM de users
  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end  
  
  def edit?
    user.admin?
  end
  
  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
