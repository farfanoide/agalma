class Backend::DashboardController < BackendController
  def home
    @posts = policy_scope(Post)
    @pages = []
    @pages = Page.all if current_user.admin?
    @branches = policy_scope(Branch)
    @users = User.all
    # @roles = Rolification.all.group :id, :user_id
  end

  def set_current_branch
    session[:active_branch] = params[:branch_id]
    current_user.active_branch = session[:active_branch]
    current_user.save

    #FIXME: redirigir al REFERRER
    redirect_to :back
  end
end
