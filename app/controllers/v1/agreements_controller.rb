class V1::AgreementsController < V1::BaseController
  before_action :set_company
  before_action :set_agreement, only: [:show, :update, :destroy]

  # GET /companies/1/agreements
  def index
    @agreements = @company.agreements
  end

  # GET /companies/1/agreements/1
  def show

  end

  # POST /companies/1/agreements
  def create
    @agreement = @company.agreements.new(agreement_params)

    if @agreement.save
      render :show, status: :created
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1/agreements/1
  def update
    if @agreement.update(agreement_params)
      render :show
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1/agreements/1
  def destroy
    @agreement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agreement_params
      params.require(:agreement).permit(:start_at, :end_at, :name, :user_id, :destroyed_at)
    end
end
