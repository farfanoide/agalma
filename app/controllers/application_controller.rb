class ApplicationController < ActionController::Base
  helper_method :active_branch_id, :active_branch, :pages_menu

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
  end

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end
  def pages_menu
    @pages_menu ||= menu_branch.pages.active.order(:position)
  end
  def menu_branch
    active_branch.menu
  end

  def active_branch
    Branch.find active_branch_id
  end

  def active_branch_id
    session[:active_branch].to_i if !session[:active_branch].nil?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def set_internal_branches
    @internal_branches = Branch.internal
  end
end
