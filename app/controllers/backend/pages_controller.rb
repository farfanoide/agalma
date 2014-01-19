class Backend::PagesController < BackendController
  before_action :set_backend_page, only: [:show, :edit, :update, :destroy]

  # GET /backend/pages
  # GET /backend/pages.json
  def index
    @backend_pages = Backend::Page.all
  end

  # GET /backend/pages/1
  # GET /backend/pages/1.json
  def show
  end

  # GET /backend/pages/new
  def new
    @backend_page = Backend::Page.new
  end

  # GET /backend/pages/1/edit
  def edit
  end

  # POST /backend/pages
  # POST /backend/pages.json
  def create
    @backend_page = Backend::Page.new(backend_page_params)

    respond_to do |format|
      if @backend_page.save
        format.html { redirect_to @backend_page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/pages/1
  # PATCH/PUT /backend/pages/1.json
  def update
    respond_to do |format|
      if @backend_page.update(backend_page_params)
        format.html { redirect_to @backend_page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/pages/1
  # DELETE /backend/pages/1.json
  def destroy
    @backend_page.destroy
    respond_to do |format|
      format.html { redirect_to backend_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_page
      @backend_page = Backend::Page.find_by!(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_page_params
      params.require(:backend_page).permit(:title, :slug, :body, :active)
    end
end
