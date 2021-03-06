class Backend::MenusController < BackendController
  before_action :set_backend_menu, only: [:show, :edit, :update, :destroy]

  # GET /backend/menus
  def index
    @menus = Menu.all
  end

  # GET /backend/menus/1
  def show; end

  # GET /backend/menus/new
  def new
    @menu = Menu.new
    authorize @menu, :create?
    @pages = Page.all
  end

  # GET /backend/menus/1/edit
  def edit
    authorize @menu
    @other_menu_pages = Page.where.not(menu: @menu)
    @no_menu_pages = Page.where(menu_id: nil)
  end

  # POST /backend/menus
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to backend_menus_url, notice: 'Menu was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /backend/menus/1
  def update
    local_params = menu_params
    page_ids = ids_str_to_array local_params.delete(:page_ids)
    unselect = ids_str_to_array local_params.delete(:non_selected)
    if @menu.update(local_params)
      sort_pages(page_ids)
      unselect_pages(unselect)
      redirect_to backend_menus_url, notice: 'Menu was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /backend/menus/1
  def destroy
    authorize @menu
    @menu.destroy
    redirect_to backend_menus_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backend_menu
    @menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def menu_params
    pages_attrs = [:id, :position, :active]
    params.require(:menu).permit(:name, :position, :_destroy, pages_attributes: pages_attrs, page_ids:[], non_selected: [])
  end

  def pages_hash(ids)
    pages = {}
    ids.each_with_index do |id, position|
      pages[id] = {position: position, menu: @menu}
    end
    pages
  end

  # TODO: check for helper methods here
  def ids_str_to_array(string)
    string.first.split ','
  end

  def sort_pages(page_ids)
    pages = pages_hash page_ids
    Page.update(pages.keys, pages.values)
  end

  def unselect_pages(page_ids)
    page_ids.each do |id|
      page = Page.find id
      page.update_attributes(menu_id: nil, position: nil) if page.menu = @menu
    end
  end
end
