class BranchPolicy < Struct.new(:user, :branch)
  def create?
    user.admin?
  end

  def edit?
    user.admin? || user.can_edit_branch?(branch)
  end
end
