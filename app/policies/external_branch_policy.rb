class ExternalBranchPolicy < Struct.new(:user, :branch)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all if user.admin?
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
