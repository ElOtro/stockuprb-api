class V1::VatRatesController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_vat_rate, only: [:show, :update, :destroy]

  # GET /vat_rates
  def index
    @vat_rates = VatRate.all
  end

  # GET /vat_rates/1
  def show
  end

  # POST /vat_rates
  def create
    @vat_rate = VatRate.new(vat_rate_params)

    if @vat_rate.save
      render :show, status: :created
    else
      render json: @vat_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vat_rates/1
  def update
    if @vat_rate.update(vat_rate_params)
      render :show
    else
      render json: @vat_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vat_rates/1
  def destroy
    # check if there is dangerous association
    if @vat_rate.valid?(:destroy)
      @vat_rate.destroy
    else
      # returns 409 status and error with a message where is conflict 
      # in terms of rails it is :conflict
      render json: @vat_rate.errors, status: :conflict
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vat_rate
      @vat_rate = VatRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vat_rate_params
      params.require(:vat_rate).permit(:is_active, :is_default, :rate, :name, :destroyed_at)
    end
end
