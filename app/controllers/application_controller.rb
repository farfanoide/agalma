class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :error
  before_action :fetch_static_pages
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :fetch_slider_images
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def fetch_static_pages
    set_menu_pages
    @quienes ||= Page.find_by!(slug: 'quienes-somos')
    @cTeraEd ||= Page.find_by!(slug: 'centros-terapeuticos-educativos')
    @cEsTemp ||= Page.find_by!(slug: 'centro-de-estimulacion-temprana')
    @n_pages.reject! {|page| [@quienes, @cTeraEd, @cEsTemp].include? page }
  end

  def fetch_slider_images
    @slider_images ||= ImageSlider.all
  end

  def set_menu_pages
    @n_pages ||= Page.all
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
