class Backend::PostsController < BackendController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
  end

  def new
    @post = Post.new
  end

  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Noticia actualizada correctamente.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @post.user = current_user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Noticia actualizada correctamente.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to backend_posts_url }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      image_attrs   = [:id, :file_name, :name, :_destroy, :description]
      gallery_attrs = [:id, :post_id, :name, :description, :_destroy, images_attributes: image_attrs]
      params.require(:post).permit(:title, :description, :content, :branch_id, galery_attributes: gallery_attrs)
    end
end
