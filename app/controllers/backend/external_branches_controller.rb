class Backend::ExternalBranchesController < BackendController
  before_action :set_external_branch, only: [:show, :edit, :update, :destroy]

  # GET /backend/external_branches
  # GET /backend/external_branches.json
  def index
    @external_branches = ExternalBranch.all
  end

  # GET /backend/external_branches/1
  # GET /backend/external_branches/1.json
  def show
  end

  # GET /backend/external_branches/new
  def new
    @external_branch = ExternalBranch.new
  end

  # GET /backend/external_branches/1/edit
  def edit
  end

  # POST /backend/external_branches
  # POST /backend/external_branches.json
  def create
    @external_branch = ExternalBranch.new(external_branch_params)

    respond_to do |format|
      if @external_branch.save
        format.html { redirect_to backend_external_branch_url(@external_branch), notice: 'External branch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @external_branch }
      else
        format.html { render action: 'new' }
        format.json { render json: @external_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/external_branches/1
  # PATCH/PUT /backend/external_branches/1.json
  def update
    respond_to do |format|
      if @external_branch.update(external_branch_params)
        format.html { redirect_to backend_external_branch_url(@external_branch), notice: 'External branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @external_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/external_branches/1
  # DELETE /backend/external_branches/1.json
  def destroy
    @external_branch.destroy
    respond_to do |format|
      format.html { redirect_to backend_external_branches_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_external_branch
    @external_branch = ExternalBranch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def external_branch_params
    params.require(:external_branch).permit(:name, :description, :address, :email, :zipcode, :zone)
  end
end
