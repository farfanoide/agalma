class Backend::PagesController < BackendController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    authorize Page
    @pages = Page.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
    authorize @page
  end

  # GET /pages/1/edit
  def edit
    authorize @page
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    authorize @page
    @page.branch.menu.add_page @page
    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: 'Pagina actualizada correctamente.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    authorize @page
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: 'Pagina actualizada correctamente.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    authorize @page
    @page.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def set_page
      @page = Page.find_by!(slug: params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :slug, :body, :active, :branch_id, :menu_id)
    end
end
