class BranchesController < ApplicationController
  before_action :set_branch, only: [:show]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
  end

  # # GET /branches/1
  # # GET /branches/1.json
  # def show
  # end

  def consultorios_externos
    @branches = Branch.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end
end