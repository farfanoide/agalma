class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @search = Sunspot.search Post do
      fulltext params[:search] do
        boost_fields :title => 2.0
      end
    end
#    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 5)
    @posts = @search.results
  end

  def show
    @gallery = @post.galery
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:id )
    end
end
