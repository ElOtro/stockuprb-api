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

  def user_login(user)
    secret = Rails.application.secrets.secret_key_base

    encoding = 'HS512'

    request.headers['Authorization'] =
      JWT.encode({ email: user.email, password: user.password }, secret, encoding)
  end

  def set_devise_mapping
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
end
