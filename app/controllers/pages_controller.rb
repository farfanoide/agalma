class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show; end

  private
  def set_page
    @page = Page.find_by!(slug: params[:id])
  end
end
