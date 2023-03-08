module ApiHelpers
  def sign_in_with_api(user)
    post '/v1/auth', params: {
      email: user.email,
      password: user.password
    }
  end
end
