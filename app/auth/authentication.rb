class Authentication
  def initialize(user_object)
    @email = user_object[:email]
    @senha = user_object[:senha]
    @usuario = Usuario.find_by(email: @email)
  end

  def authenticate
    @usuario && @usuario.authenticate(@email)
  end

  def generate_token
    JsonWebToken.encode(user_id: @usuario.id, user_name: @usuario.nome, user_email: @usuario.email)
  end
end