class MenuPolicy < Struct.new(:user, :menu)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
