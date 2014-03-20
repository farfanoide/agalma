class Backend::PostsController < BackendController

    before_action :set_post, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
        @post.build_galery

    end

    def edit
    end

    def create
        @post = Post.new(post_params)

        respond_to do |format|
            if @post.save
                format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
                format.json { render action: 'show', status: :created, location: @post }
            else
                format.html { render action: 'new' }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @post.update(post_params)
                format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to backend_posts_url }
            format.json { head :no_content }
        end
    end

    private
        def set_post
            @post = Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:title, :description, :content, :branch_id, galeries_attributes:[:id,:post_id,:name,:description,:_destroy,images_attributes:[:id,:file_name,:name,:_destroy]])
        end
end
