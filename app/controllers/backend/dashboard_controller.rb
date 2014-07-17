class Backend::DashboardController < BackendController
  def home
    @posts = policy_scope(Post)
    @pages = policy_scope(Page)
    @pages = Page.all if current_user.admin?
    @branches = policy_scope(Branch)
    @users = User.all
    # @roles = Rolification.all.group :id, :user_id
  end
end
