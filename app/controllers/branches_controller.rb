class BranchesController < ApplicationController

  before_action :set_branch, only: [:show]

  # GET /branches
  def index
    @branches = Branch.all
  end

  # # GET /branches/1
  def show
    @posts = @branch.posts
  end

  def set_frontend_branch
    session[:active_branch] = params[:branch_id]
    redirect_to :back
  end

  private
  def set_branch
    @branch = Branch.find(params[:id])
  end
end
