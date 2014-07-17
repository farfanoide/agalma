class Backend::GaleriesController < BackendController
  before_action :set_galery, only: [ :edit, :update, :destroy]

  # GET /galeries/new
  def new
    @galery = Galery.new
    authorize @galery, :create?
    @galery.images.build
  end

  # GET /galeries/1/edit
  def edit
    authorize @galery
  end

  # POST /galeries
  def create
    @galery = Galery.new(galery_params)
    authorize @galery
    if @galery.save
      redirect_to @galery, notice: 'Galery was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @galeries= Galery.all
  end
  # PATCH/PUT /galeries/1
  def update
    authorize @galery, :edit?
    if @galery.update(galery_params)
      redirect_to @galery, notice: 'Galery was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /galeries/1
  def destroy
    authorize @galery
    @galery.destroy
    redirect_to backend_galeries_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_galery
    @galery = Galery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def galery_params
    params.require(:galery).permit(:name, :description, :public, images_attributes: [:id, :file_name, :name, :_destroy  ])
  end
end
