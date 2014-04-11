class Backend::BranchesController < BackendController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    @branches = policy_scope(Branch)
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    authorize @branch, :create?
  end

  # GET /branches/1/edit
  def edit
    authorize @branch
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)
    set_branch_menu @branch
    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'La sucursal se ha creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @branch }
      else
        format.html { render action: 'new' }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'La sucursal se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to backend_branches_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      rolif_attrs = [:id, :role_id, :user_id, :branch_id, :_destroy]
      telep_attrs = [:id, :ext, :num, :branch_id, :_destroy]
      menu_attrs  = [:id, :position, :name, :branch_id]
      params.require(:branch).permit(:id, :name, :description, :zone,:email, :zipcode , :address,
                                     rolifications_attributes: rolif_attrs,
                                     telephones_attributes: telep_attrs,
                                     menu_attributes: menu_attrs)
    end

    def set_branch
      @branch = Branch.find(params[:id])
    end

    def set_branch_menu(branch)
      menu_attrs = {}
      menu_attrs[:position] = 'left'
      menu_attrs[:name] = "Menu - #{branch.name}"
      branch.build_menu(menu_attrs)
    end
end
