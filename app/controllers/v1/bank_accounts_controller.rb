class V1::BankAccountsController < V1::BaseController
  before_action :set_organisation
  before_action :set_bank_account, only: [:show, :update, :destroy]

  # GET /bank_accounts
  def index
    @bank_accounts = @organisation.bank_accounts
  end

  # GET /bank_accounts/1
  def show

  end

  # POST /bank_accounts
  def create
    @bank_account = @organisation.bank_accounts.new(bank_account_params)

    if @bank_account.save
      render :show, status: :created
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  def update
    if @bank_account.update(bank_account_params)
      render :show
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  def destroy
    @bank_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:organisation_id])
    end

    def set_bank_account
      @bank_account = @organisation.bank_accounts.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.require(:bank_account).permit(:is_default, :account_type, :name, { details: {} }, :destroyed_at)
    end
end
