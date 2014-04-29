class Backend::UsersController < BackendController
  before_action :set_backend_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    authorize User
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

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
  # POST /users.json
  def create
    @user = User.new(user_params)
    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to backend_user_url(@user), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to backend_user_url(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    authorize @user
    respond_to do |format|
      format.html { redirect_to backend_users_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_backend_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    position_user_attrs = [:id, :branch_id, :user_id, :_destroy, :position_id]
    params.require(:user).permit(:name, :avatar, :email, role_ids: [],
                                 position_users_attributes: position_user_attrs)
  end
end
