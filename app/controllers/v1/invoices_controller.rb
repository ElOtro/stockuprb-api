class V1::InvoicesController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[show update destroy]

  # GET /invoices
  def index
    @invoices = Invoice.includes(:organisation, :bank_account, :company, :agreement, :project, :user)
    @invoices = ::Queries::Invoices.new(@invoices).call(filter_params)
    @meta = pagination_dict(@invoices)
  end

  # GET /invoices/1
  def show; end

  # POST /invoices
  def create
    # DO NOT DO THIS!
    # if params[:invoice].has_key?('invoice_items')
    #   params[:invoice][:invoice_items_attributes] =
    #     params[:invoice].delete(:invoice_items)
    # end
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user

    if @invoice.save
      render :show, status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      render :show
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
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

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def filter_params
    params.permit(:format, :user_id, :organisation_id, :company_id, :search, :sort, :direction, :page, :limit)
  end

  def invoice_params
    params.require(:invoice).permit(:is_active, :date, :number, :organisation_id, :bank_account_id, :company_id,
                                    :agreement_id, :project_id, :amount, :discount, :vat, :user_id,
                                    invoice_items_attributes: %i[id position product_id description unit_id
                                                                 quantity price amount discount_rate discount vat_rate_id vat])
  end
end
