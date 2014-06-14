class ApplicationController < ActionController::Base
  helper_method :side_menu, :bottom_menu

  include Pundit


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :error
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :fetch_slider_images
  before_action :set_internal_branches
  before_action :set_menus
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def fetch_slider_images
    @slider_images ||= ImageSlider.all
  end

  def set_menus
    @top_menu ||= Menu.top.first
    @side_menu ||= Menu.left.first
    @bottom_menu ||= Menu.bottom.first
  end

  def user_not_authorized
    flash[:error] = "No estas autorizado para realizar esta accion."
    redirect_to request.headers["Referer"] || root_path
  end

  def side_menu
    @side_menu ||= Menu.find_by!(position: 'left')
  end

  def bottom_menu
    @bottom_menu ||= Menu.find_by!(position: 'bottom')
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :current_password , :avatar, :email, :password, :password_confirmation, :curriculum, :profession, :titles)
    end
  end

  def set_internal_branches
    @internal_branches ||= Branch.all
  end
end
