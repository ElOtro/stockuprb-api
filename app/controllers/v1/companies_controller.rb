class V1::CompaniesController < V1::BaseController
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  def index
    @sort = sort_column
    @direction = sort_direction

    @companies = Company.all
    @companies = @companies.reorder(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:limit])

    @meta = pagination_dict(@companies)
  end

  # GET /search
  # GET /search.json
  def search
    @companies = Company.order(:name)
    @companies = @companies.search(params[:q]) if params[:q].present?
    @companies = @companies.page(1).per(20)
  end

  # GET /companies/1
  def show; end

  # POST /companies
  def create
    params[:company][:contacts_attributes] = params[:company].delete(:contacts) if params[:company].has_key?('contacts')
    @company = Company.new(company_params)

    if @company.save
      render :show, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render :show
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
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
    params[:sort] || 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:logo, :name, :full_name, :company_type, { details: {} }, :user_id, :destroyed_at,
                                    contacts_attributes: [:id, :role, :title, :name, :phone, :email, :start_at, :sign, { details: {} }])
  end
end
