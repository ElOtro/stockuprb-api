class V1::InvoiceItemsController < V1::BaseController
  before_action :set_invoice
  before_action :set_invoice_item, only: %i[show update destroy]

  # GET /invoices/1/invoice_items
  def index
    @invoice_items = @invoice.invoice_items
  end

  # GET /invoices/1/invoice_items/1
  def show
  
  end

  # POST /invoices/1/invoice_items
  def create
    @invoice_item = @invoice.invoice_items.new(invoice_item_params)

    if @invoice_item.save
      render :show, status: :created
    else
      render json: @invoice_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1/invoice_items/1
  def update
    if @invoice_item.update(invoice_item_params)
      render :show
    else
      render json: @invoice_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1/invoice_items/1
  def destroy
    @invoice_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end

  def set_invoice_item
    @invoice_item = @invoice.invoice_items.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_item_params
    params.require(:invoice_item).permit(:invoice_id, :position, :product_id, :description, :unit_id, :quantity,
                                         :price, :amount, :discount_rate, :discount, :vat_rate_id, :vat)
  end
end
