class Backend::GaleriesController < BackendController
  before_action :set_galery, only: [ :edit, :update, :destroy]

  # GET /galeries/new
  def new
    @galery = Galery.new
    @galery.images.build
  end

  # GET /galeries/1/edit
  def edit
  end

  # POST /galeries
  def create
    @galery = Galery.new(galery_params) 
    respond_to do |format|
      if @galery.save
        format.html { redirect_to @galery, notice: 'Galery was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def index
    @galeries= Galery.all
  end
  # PATCH/PUT /galeries/1
  def update
    respond_to do |format|
      if @galery.update(galery_params)
        format.html { redirect_to @galery, notice: 'Galery was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /galeries/1
  def destroy
    @galery.destroy
    respond_to do |format|
      format.html { redirect_to backend_galeries_url }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_galery
    @galery = Galery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def galery_params
    params.require(:galery).permit(:name, :description, images_attributes: [:id, :file_name, :name, :_destroy  ])
  end
end
