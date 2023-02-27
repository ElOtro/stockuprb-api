class V1::UnitsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_unit, only: %i[show update destroy]

  # GET /units
  def index
    @units = Unit.all
  end

  # GET /units/1
  def show
    
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      render :show, status: :created
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /units/1
  def update
    if @unit.update(unit_params)
      render :show
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /units/1
  def destroy
    # check if there is dangerous association
    if @unit.valid?(:destroy)
      @unit.destroy
    else
      # returns 409 status and error with a message where is conflict
      # in terms of rails it is :conflict
      render json: @unit.errors, status: :conflict
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_unit
    @unit = Unit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def unit_params
    params.require(:unit).permit(:name, :destroyed_at)
  end
end
