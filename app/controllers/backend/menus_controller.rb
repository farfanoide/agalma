class Backend::MenusController < BackendController
  before_action :set_backend_menu, only: [:show, :edit, :update, :destroy]

  # GET /backend/menus
  def index
    @menus = Menu.all
  end

  # GET /backend/menus/1
  def show
  end

  # GET /backend/menus/new
  def new
    @menu = Menu.new
    @general_pages = Page.general
  end

  # GET /backend/menus/1/edit
  def edit
    @general_pages = Page.general if @menu.general?
  end

  # POST /backend/menus
  def create
    @menu = Menu.new(backend_menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to backend_menus_url, notice: 'Menu was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /backend/menus/1
  def update
    respond_to do |format|
      if @menu.update(backend_menu_params)
        format.html { redirect_to backend_menus_url, notice: 'Menu was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /backend/menus/1
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to backend_menus_url }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backend_menu
    @menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def backend_menu_params
    pages_attrs = [:id, :position]
    params.require(:menu).permit(:name, :position, :_destroy, pages_attributes: pages_attrs)
  end
end
