class Backend::ImageSlidersController <  BackendController
  before_action :set_image_slider, only: [:show, :edit, :update, :destroy]

  # GET /image_sliders
  # GET /image_sliders.json
  def index
    @image_sliders = ImageSlider.all
  end

  # GET /image_sliders/1
  # GET /image_sliders/1.json
  def show
  end

  # GET /image_sliders/new
  def new
    @image_slider = ImageSlider.new
  end

  # GET /image_sliders/1/edit
  def edit
  end

  # POST /image_sliders
  # POST /image_sliders.json
  def create
    @image_slider = ImageSlider.new(image_slider_params)

    respond_to do |format|
      if @image_slider.save
        format.html { redirect_to backend_image_sliders_path, notice: 'Image slider was successfully created.' }
        format.json { render action: 'index', status: :created, location: @image_slider }
      else
        format.html { render action: 'new' }
        format.json { render json: @image_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_sliders/1
  # PATCH/PUT /image_sliders/1.json
  def update
    respond_to do |format|
      if @image_slider.update(image_slider_params)
        format.html { redirect_to backend_image_sliders_path, notice: 'Image slider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_sliders/1
  # DELETE /image_sliders/1.json
  def destroy
    @image_slider.destroy
    respond_to do |format|
      format.html { redirect_to backend_image_sliders_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_slider
      @image_slider = ImageSlider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_slider_params
      params.require(:image_slider).permit(:image)
    end
end
