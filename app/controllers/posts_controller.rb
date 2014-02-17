class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def index
    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def show
  end




  private
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:id )
    end  
end
