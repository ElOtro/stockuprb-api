module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def login_with_api(user)
    post '/v1/auth', params: {
      email: user.email,
      password: user.password
    }
  end

  def set_devise_mapping
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  def generate_jwt(resource)
    JWT.encode({ sub: resource.id, exp: 1.days.from_now.to_i, iss: "stockup-api", aud: "stockup-api"}, Rails.application.secrets.secret_key_base, 'HS256')
  end

end
