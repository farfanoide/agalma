class Backend::BranchesController < ApplicationController
before_action :set_branch, only: [:show, :edit, :update, :destroy]

 def index
  @branches = Branch.all
 end

 def show
 end

 def new
   @branch = Branch.new
 end

 def edit
 end
 
 def create
   @branch = Branch.new(branch_params)
   respond_to do |format|
     if @branch.save
       format.html { redirect_to [:backend, @branch], notice: 'La sucursal a sido creada' }
       format.json { render action: 'show', status: :created, location: @branch } 
     else
       format.html { render action: 'new' }
       format.json { render json: @branch.errors, status: :unprocessable_entity }
     end
   end
 end

 def update
  respond_to do |format|
    if @branch.update(branch_params)
      format.html { redirect_to [:backend, @branch], notice: 'La sucursal a sido modificada' }
      format.json { head :no_content } 
    else
      format.html { render action: 'edit' }
      format.json { render json: @branch.errors, status: :unprocessable_entity }
    end
  end
 end

 def destroy
   @branch.destroy
   respond_to do |format|
     format.html { redirect_to backend_branches_url }
     format.json { head :no_content }
   end
 end
 
private 
  def set_branch
   @branch = Branch.find (params[:id])
  end

  def branch_params
    params.require(:branch).permit(:id, :name, :description,
				  rolifications_attributes: [ :id, :role_id, :user_id, :branch_id, :_destroy],
                                  telephones_attributes: [:id, :ext, :num, :branch_id, :_destroy])
  end 
end
