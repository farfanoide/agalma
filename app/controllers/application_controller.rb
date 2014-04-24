class ApplicationController < ActionController::Base
  helper_method :active_branch_id, :active_branch, :active_branch_menu

  include Pundit


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :error
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :fetch_slider_images
  before_action :set_internal_branches
  before_action :set_menus
  before_action :set_active_branch
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def intro
    session[:active_branch] = Branch.first.id
    render template: 'application/intro', layout: 'intro'
  end

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

  def active_branch_menu
    @branch_menu ||= active_branch.menu
  end

  def active_branch
    @active_branch ||= Branch.find active_branch_id
  end

  def active_branch_id
    session[:active_branch].to_i if !session[:active_branch].nil?
  end

  def set_active_branch
    session[:active_branch] = Branch.default_branch.id if session[:active_branch].nil?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def set_internal_branches
    @internal_branches ||= Branch.internal
  end
end
