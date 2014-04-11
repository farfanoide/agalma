class Backend::MenusController < ApplicationController
  before_action :set_backend_menu, only: [:show, :edit, :update, :destroy]

  # GET /backend/menus
  # GET /backend/menus.json
  def index
    @backend_menus = Menu.all
  end

  # GET /backend/menus/1
  # GET /backend/menus/1.json
  def show
  end

  # GET /backend/menus/new
  def new
    @backend_menu = Menu.new
  end

  # GET /backend/menus/1/edit
  def edit
  end

  # POST /backend/menus
  # POST /backend/menus.json
  def create
    @backend_menu = Menu.new(backend_menu_params)

    respond_to do |format|
      if @backend_menu.save
        format.html { redirect_to @backend_menu, notice: 'Menu was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend_menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/menus/1
  # PATCH/PUT /backend/menus/1.json
  def update
    respond_to do |format|
      if @backend_menu.update(backend_menu_params)
        format.html { redirect_to @backend_menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/menus/1
  # DELETE /backend/menus/1.json
  def destroy
    @backend_menu.destroy
    respond_to do |format|
      format.html { redirect_to backend_menus_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backend_menu
    @backend_menu = Menu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def backend_menu_params
    params.require(:menu).permit(:name,:_destroy, page_ids:[])
  end
end
