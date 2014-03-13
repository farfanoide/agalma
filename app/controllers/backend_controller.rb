class BackendController < ActionController::Base

  add_flash_types :error
  include Pundit

  before_filter :authorize_user
  layout "backend"

  private
    def authorize_user
      authenticate_user!
      redirect_to :root unless current_user.admin?
    end
end