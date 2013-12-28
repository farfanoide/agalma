class Backend::DashboardController < BackendController
  def home
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end
end
