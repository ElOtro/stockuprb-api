class V1::AgreementsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_agreement, only: %i[show update destroy]

  # GET /agreements
  def index
    @sort = sort_column
    @direction = sort_direction

    @agreements = Agreement.order(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:limit])

    @meta = pagination_dict(@agreements)
  end

  # GET /agreements/1
  def show; end

  # POST /agreements
  def create
    @agreement = Agreement.new(agreement_params)
    # @agreement.user = current_user if current_user

    if @agreement.save
      render :show, status: :created
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agreements/1
  def update
    if @agreement.update(agreement_params)
      render :show
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agreements/1
  def destroy
    @agreement.destroy
  end

  private

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  def sort_column
    params[:sort] || 'start_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_agreement
    @agreement = Agreement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def agreement_params
    params.require(:agreement).permit(:company_id, :start_at, :end_at, :name, :user_id, :destroyed_at)
  end
end
