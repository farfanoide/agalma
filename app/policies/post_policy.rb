class PostPolicy < Struct.new(:user, :post)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      end
    end
  end
  def create?
    user.admin? || user.can_manage_post?(post)
  end

  def edit?
    user.admin?
  end
end 
