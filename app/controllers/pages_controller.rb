class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by!(slug: params[:id])
    end
end
