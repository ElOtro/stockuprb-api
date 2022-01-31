class V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    # puts sign_in_params[:email]
    resource = User.find_for_database_authentication(email: params[:email])
    # return invalid_login_attempt unless resource
    if resource && resource.valid_password?(params[:password]) && resource.is_active
      token = generate_jwt(resource)
      render json: { token: token }
    else
      render json: { errors: 'Not Authenticated' }, status: :unauthorized
    end
  end

  # DELETE /resource/sign_out
  def destroy
    respond_to_on_destroy
  end

  private

  def generate_jwt(resource)
    JWT.encode({ sub: resource.id, exp: 1.days.from_now.to_i, iss: "stockup-api", aud: "stockup-api"}, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
