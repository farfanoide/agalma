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
    if current_user.branches.any? && session[:active_branch].nil?
      session[:active_branch] = current_user.active_branch
      # FIXME: cuando asignas un rol a un usuario, guardar en la DB
      # el valor de active_branch en el usuario
    end
  end
end