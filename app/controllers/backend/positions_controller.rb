class Backend::PositionsController < BackendController
  before_action :set_backend_position, only: [ :edit, :update, :destroy]

  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to backend_position_url(@position), notice: 'Cargo creado correctamente' }
        format.html {render action: 'index'}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to backend_positions_url }
    end
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
     respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to backend_position_url(@position), notice: 'Cargo modificado correctamente' }
      else
        format.html {render action: 'edit'}
      end
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
