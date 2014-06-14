class PagePolicy < Struct.new(:user, :page)
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
