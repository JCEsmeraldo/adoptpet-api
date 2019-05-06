class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all
    json_response(@pets)
  end

  # POST /pets
  def create
    @pet = Pet.create!(usuario_params)
    json_response(@pet, :created)
  end

  # GET /pets/:id
  def show
    json_response(@pet)
  end

  # PUT /pets/:id
  def update
    @pet.update(pet_params_update)
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
    params.permit(:nome, :data_nasc, :genero, :especie, :descricao, :id_usuario)
  end


  def set_pet
    @pet = Pet.find(params[:id])
  end
end
