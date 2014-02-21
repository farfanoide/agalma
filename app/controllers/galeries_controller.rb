class GaleriesController < ApplicationController
  before_action :set_galery, only: [:show, :edit]

  # GET /galeries
  # GET /galeries.json
  def index
    @galeries = Galery.all
  end

  # GET /galeries/1
  # GET /galeries/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galery
      @galery = Galery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def galery_params
      params.require(:galery).permit(:name, :description, images_attributes: [:id, :file_name, :name ])
    end
end
