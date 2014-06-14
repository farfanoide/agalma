class Backend::ImageSlidersController <  BackendController
  before_action :set_image_slider, only: [:edit, :update, :destroy]

  # GET /image_sliders
  def index
    @image_sliders = ImageSlider.all
  end

  # GET /image_sliders/new
  def new
    @image_slider = ImageSlider.new
    authorize @image_slider, :create?
  end

  # GET /image_sliders/1/edit
  def edit
    authorize @image_slider
  end

  # POST /image_sliders
  def create
    @image_slider = ImageSlider.new(image_slider_params)
    authorize @image_slider

    respond_to do |format|
      if @image_slider.save
        format.html { redirect_to backend_image_sliders_path, notice: 'Image slider was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /image_sliders/1
  def update
    authorize @image_slider, :edit?
    respond_to do |format|
      if @image_slider.update(image_slider_params)
        format.html { redirect_to backend_image_sliders_path, notice: 'Image slider was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /image_sliders/1
  def destroy
    authorize @image_slider
    @image_slider.destroy
    respond_to do |format|
      format.html { redirect_to backend_image_sliders_path }
    end
  end

  private
    def set_image_slider
      @image_slider = ImageSlider.find(params[:id])
    end

    def image_slider_params
      params.require(:image_slider).permit(:image)
    end
end
