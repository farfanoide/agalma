class Backend::DashboardController < BackendController


  
  def home
    @posts = Post.all
    @pages = Page.all
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end
end
