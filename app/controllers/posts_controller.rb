class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    if active_branch_id.nil?
      render template: 'application/intro', layout: 'intro'
    else
      @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @gallery = @post.galery
  end

  def active_branch
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:id )
    end

end
