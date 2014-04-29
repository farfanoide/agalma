class BackendController < ActionController::Base
  add_flash_types :error
  include Pundit

  before_filter :authorize_user
  layout 'backend'

  private

  def authorize_user
    authenticate_user!
    # TODO: refactor this to pundit!
    redirect_to :root if !current_user.has_backend_role?
  end
end