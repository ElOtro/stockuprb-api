class V1::ProductsController < V1::BaseController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @sort = sort_column
    @direction = sort_direction

    @products = Product.includes(:vat_rate, :unit)
    @products = @products.reorder(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:limit])

    @meta = pagination_dict(@products)
  end

  # GET /products/1
  def show
    
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render :show
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    # check if there is dangerous association
    if @product.valid?(:destroy)
      @product.destroy
    else
      # returns 409 status and error with a message where is conflict
      # in terms of rails it is :conflict
      render json: @product.errors, status: :conflict
    end
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
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:is_active, :product_type, :name, :description, :sku, :price,:vat_rate_id, 
                                    :unit_id, :user_id, :search_vector, :destroyed_at)
  end
end
