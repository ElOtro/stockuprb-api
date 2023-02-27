class V1::ContactsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /companies/1/contacts
  def index
    @contacts = @company.contacts
  end

  # GET /companies/1/contacts/1
  def show

  end

  # POST /contacts
  def create
    @contact = @company.contacts.new(contact_params)

    if @contact.save
      render :show, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1/contacts/1
  def update
    if @contact.update(contact_params)
      render :show
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1/contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_contact
      @contact = @company.contacts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:role, :title, :name, :phone, :email, :start_at, :sign, { details: {} }, :destroyed_at)
    end
end
