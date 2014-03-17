class Backend::DashboardController < BackendController
  def home
    @posts = Post.all
    @pages = Page.all
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end

  def set_current_branch
    session[:active_branch] = params[:branch_id]
    current_user.active_branch = session[:active_branch]
    current_user.save

    #FIXME: redirigir al REFERRER
    redirect_to [:backend, :root]
  end
end
