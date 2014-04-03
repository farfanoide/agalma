class PostPolicy < Struct.new(:user, :post)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        branch = Branch.find user.active_branch
        branch.posts
      end
    end
  end

  def create?
    user.admin? || user.can_manage_post?(post)
  end

  def edit?
    true
    #user.admin? || user.can_manage_post?(post)
  end
end
