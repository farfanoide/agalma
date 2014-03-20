class BranchPolicy < Struct.new(:user, :branch)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        user.branches
      end
    end
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin? || user.can_edit_branch?(branch)
  end

  def destroy?
    user.admin?
  end
end
