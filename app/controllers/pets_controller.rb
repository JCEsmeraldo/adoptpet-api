class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all
    json_response(@pets)
  end

  def pets_nao_adotados
    @pets = Pet.where(:adotado => false)
    json_response(@pets)
  end

  # POST /pets
  def create
    @pet = Pet.create!(pet_params)
    json_response(@pet, :created)
  end

  # GET /pets/:id
  def show
    json_response(@pet)
  end

  # GET /pets/usuario/:id
  def pets_usuario
    @pets = Pet.where(usuario_id: params[:id])
    json_response(@pets)
  end

  # GET /pets_adotados/:id
  def pets_adotados
    @pets = Pet.where(usuario_id: params[:id], adotado: true)
    json_response(@pets)
  end

  # PUT /pets/:id
  def update
    @pet.update(pet_params)
    head :no_content
  end

  # DELETE /pets/:id
  def destroy
    @pet.destroy
    head :no_content
  end

  private

  def pet_params
    # whitelist params
    params.permit(:nome, :data_nasc, :genero, :especie, :descricao, :usuario_id, :porte, :foto, :adotado)
  end


  def set_pet
    @pet = Pet.find(params[:id])
  end
end
