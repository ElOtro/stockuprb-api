class V1::OrganisationsController < V1::BaseController
  before_action :authenticate_user!
  before_action :set_organisation, only: %i[show update destroy]

  # GET /organisations
  def index
    @organisations = Organisation.all
  end

  # GET /organisations/1
  def show; end

  # POST /organisations
  def create
    if params[:organisation].has_key?('bank_accounts')
      params[:organisation][:bank_accounts_attributes] = params[:organisation].delete(:bank_accounts)
    end
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      render :show, status: :created
    else
      render json: @organisation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organisations/1
  def update
    if @organisation.update(organisation_params)
      render :show
    else
      render json: @organisation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organisations/1
  def destroy
    @organisation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organisation_params
    params.require(:organisation).permit(:name, :full_name, :ceo, :ceo_title, :cfo, :cfo_title, :stamp, :ceo_sign,
                                         :cfo_sign, :is_vat_payer, { details: {} }, :uuid, :destroyed_at,
                                         bank_accounts_attributes: [:id, :is_default, :account_type, :name, { details: {} }])
  end
end
