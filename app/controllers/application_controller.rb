class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :fetch_static_pages

  private
    def fetch_static_pages
        @quienes ||= Page.find_by!(slug: 'quienes-somos')
        @cTeraEd ||= Page.find_by!(slug: 'centros-terapeuticos-educativos')
        @cEsTemp ||= Page.find_by!(slug: 'centro-de-estimulacion-temprana')
        # @quienes ||= Page.find_by!(slug: 'quienes-somos')
    end
end
