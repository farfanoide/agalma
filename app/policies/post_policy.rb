class PostPolicy < Struct.new(:user, :post)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all if user.admin?
    end
  end

  def index?
    true
  end

  def create?
    user.admin? || user.can_manage_post?(post)
  end

  def destroy?
    user.admin? || user.can_manage_post?(post)
  end

  def edit?
    user.admin? || owner?
  end

  def owner?
    true if user == post.user
  end
end 
