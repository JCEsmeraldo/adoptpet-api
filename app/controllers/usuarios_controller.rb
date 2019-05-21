class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  def login2
    @usuario = Usuario.where(email: params[:email], senha: params[:senha])
    json_response(@usuario)
  end


  def login
    @usuario = Usuario.where(email: params[:email], senha: params[:senha])
    if(@usuario.any?)
      auth_object = Authentication.new(login_params)
      render json: {
          message: "Login successful!", token: auth_object.generate_token }, status: :ok
    else
      render json: {
          message: "Incorrect email/password combination"}, status: :unauthorized
    end
  end



  # GET /usuarios
  def index
    @usuarios = Usuario.all
    json_response(@usuarios)
  end

  # POST /usuarios
  def create
    @usuario = Usuario.create!(usuario_params)
    json_response(@usuario, :created)
  end

  # GET /usuarios/:id
  def show
    json_response(@usuario)
  end

  # GET /usuarios/pedidos/:id
  def show_pedidos
    @pedidos = Pedido.joins("inner join pets on pets.id = pedidos.pet_id inner join usuarios on usuarios.id = pets.usuario_id").where(:usuarios => {:id => 1})
    json_response(@pedidos)
  end

  # GET /usuarios/pedidos/:id
  def show_pedidos_pendentes
    @pedidos = Pedido.joins("inner join pets on pets.id = pedidos.pet_id inner join usuarios on usuarios.id = pets.usuario_id").where(:usuarios => {:id => 1}, :status => 'Pendente')
    json_response(@pedidos)
  end

  # PUT /usuarios/:id
  def update
    @usuario.update(usuario_params_update)
    head :no_content
  end

  # DELETE /usuarios/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def usuario_params
    # whitelist params
    params.permit(:email, :nome, :senha, :rua, :cpf_cnpj, :bairro, :cidade, :estado, :pais, :numero, :complemento, :telefone)
  end

  def usuario_params_update
    # whitelist params
    params.permit(:nome, :senha, :rua, :cpf_cnpj, :bairro, :cidade, :estado, :pais, :numero, :complemento, :telefone)
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def login_params
    params.permit(:email, :senha)
  end

end
