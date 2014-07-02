class Backend::BranchesController < BackendController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  def index
    @branches = policy_scope(Branch)
  end

  # GET /branches/1
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
  def create
    @branch = Branch.new(branch_params)
    set_branch_menu @branch
    if @branch.save
      redirect_to @branch, notice: 'La sucursal se ha creado correctamente.' 
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /branches/1
  def update
    if @branch.update(branch_params)
      redirect_to @branch, notice: 'La sucursal se ha actualizado correctamente.' 
    else
      render action: 'edit' 
    end
  end

  # DELETE /branches/1
  def destroy
    @branch.destroy
    redirect_to backend_branches_url 
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def branch_params
    telep_attrs = [:id, :ext, :num, :branch_id, :_destroy]
    menu_attrs  = [:id, :position, :name, :branch_id]
    params.require(:branch).permit(:id, :name, :description, :zone,:email, :zipcode , :address,
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
