class Backend::ExternalBranchesController < BackendController
  before_action :set_external_branch, only: [:show, :edit, :update, :destroy]

  # GET /backend/external_branches
  def index
    @external_branches = ExternalBranch.all
  end

  # GET /backend/external_branches/1
  def show
  end

  # GET /backend/external_branches/new
  def new
    @external_branch = ExternalBranch.new
    authorize @external_branch, :create?
  end

  # GET /backend/external_branches/1/edit
  def edit
    authorize @external_branch
  end

  # POST /backend/external_branches
  def create
    @external_branch = ExternalBranch.new(external_branch_params)
    authorize @external_branch

    if @external_branch.save
      redirect_to backend_external_branch_url(@external_branch), notice: 'External branch was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /backend/external_branches/1
  def update
    authorize @external_branch, :edit?
    if @external_branch.update(external_branch_params)
      redirect_to backend_external_branch_url(@external_branch), notice: 'External branch was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /backend/external_branches/1
  def destroy
    authorize @external_branch
    @external_branch.destroy
    redirect_to backend_external_branches_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_external_branch
    @external_branch = ExternalBranch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def external_branch_params
    telep_attrs = [:id, :ext, :num, :external_branch_id, :_destroy]
    params.require(:external_branch).permit(:name, :description, :address, :email, :zipcode, :zone,
                                            external_telephones_attributes: telep_attrs, branch_ids:[])
  end
end
