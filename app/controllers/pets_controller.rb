class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all
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
    @pets = Pet.where(id_usuario: params[:id])
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
    params.permit(:nome, :data_nasc, :genero, :especie, :descricao, :id_usuario, :porte, :foto)
  end


  def set_pet
    @pet = Pet.find(params[:id])
  end
end
