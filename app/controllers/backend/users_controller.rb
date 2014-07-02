class Backend::UsersController < BackendController
  before_action :set_backend_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    authorize User
    @users = User.all
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to backend_user_url(@user), notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize @user
    if @user.update(user_params)
      redirect_to backend_user_url(@user), notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    authorize @user
    redirect_to backend_users_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backend_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    position_user_attrs = [:id, :branch_id, :user_id, :_destroy, :position_id]
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation, role_ids: [],
                                 position_users_attributes: position_user_attrs)
  end
end
