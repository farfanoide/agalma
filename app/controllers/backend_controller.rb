class BackendController < ActionController::Base
  add_flash_types :error
  include Pundit

 # before_filter :authorize_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  layout 'backend'

  private

  def authorize_user
    authenticate_user!
    # TODO: refactor this to pundit!
    redirect_to :root unless current_user.has_backend_role?
  end

  def user_not_authorized
    flash[:error] = "No estas autorizado para realizar esta accion"
    redirect_to(request.referrer || root_path)
  end

end