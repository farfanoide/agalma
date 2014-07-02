class Backend::PositionsController < BackendController
  before_action :set_backend_position, only: [ :edit, :update, :destroy]

  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to backend_position_url(@position), notice: 'Cargo creado correctamente'
      render action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    @position.destroy
    redirect_to backend_positions_url 
  end

  def edit
  end

  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def show
    redirect_to backend_positions_url
  end

  def update
    if @position.update(position_params)
      redirect_to backend_position_url(@position), notice: 'Cargo modificado correctamente' 
    else
      render action: 'edit'
    end
  end

  private

  def set_backend_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit( :name, :id, :_destroy)
  end
end
