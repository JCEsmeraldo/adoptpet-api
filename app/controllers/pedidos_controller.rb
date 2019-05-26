class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :update, :destroy]

  # GET /pedidos
  def index
    @pedidos = Pedido.all
    json_response(@pedidos)
  end

  # POST /pedidos
  def create
    @pedido = Pedido.create!(pedido_params)
    json_response(@pedido, :created)
  end

  # GET /pedidos/:id
  def show
    json_response(@pedido)
  end

  # PUT /pedidos/:id
  def update
    @pedido.update(pedido_params)
    head :no_content
  end

  # PUT /pedidos_resposta/:id
  def pedidos_resposta
    @pedido = Pedido.find(params['id'])
    if (params['status'] == 'Aprovado')
      @pet = Pet.find(@pedido.pet_id)
      @pet.adotado = true
      @pet.usuario_id = @pedido.usuario_id
      @pet.save
      @pedido.status = "Aprovado"
      @pedido.save
    else
      @pedido.status = "Negado"
      @pedido.save
    end
    json_response(@pedido, :updated)
  end

  # DELETE /pedidos/:id
  def destroy
    @pedido.destroy
    head :no_content
  end

  private

  def pedido_params
    # whitelist params
    params.permit(:pet_id, :usuario_id, :status)
  end


  def set_pedido
    @pedido = Pedido.find(params[:id])
  end
end
