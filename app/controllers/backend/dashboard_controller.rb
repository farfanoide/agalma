class Backend::DashboardController < BackendController
  def home
    @posts = Post.all
    @pages = Page.all
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end

  def set_current_branch
    session[:current_branch] ||= params[:branch_id]
    redirect_to [:backend, :root]
  end
end
