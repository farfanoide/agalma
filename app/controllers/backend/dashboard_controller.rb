class Backend::DashboardController < ApplicationController
  def home
    @branches = Branch.all
    @roles = Rolification.all.group :id, :user_id
  end
end
