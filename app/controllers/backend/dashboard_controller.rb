class Backend::DashboardController < BackendController
  def home
    @pages = Page.all
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end
end
