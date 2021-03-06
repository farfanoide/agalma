class Backend::PagesController < BackendController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
    authorize @page, :create?
    # assign branch to general pages only
    @page.branch = Branch.first unless params[:general_page].nil?
  end

  # GET /pages/1/edit
  def edit
    authorize @page
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    authorize @page
    # @page.menu.add_page @page if @page.valid?
    if @page.save
      redirect_to page_url(@page), notice: 'Pagina actualizada correctamente.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    authorize @page, :edit?
    if @page.update(page_params)
      redirect_to page_url(@page), notice: 'Pagina actualizada correctamente.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pages/1
  def destroy
    authorize @page
    @page.destroy
    redirect_to backend_pages_path
  end

  private
  def set_page
    @page = Page.find_by!(slug: params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :body, :active, :branch_id, :menu_id, :parent_page_id,
                                 widget_ids: [])
  end
end
