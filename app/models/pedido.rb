class Pedido < ApplicationRecord
  belongs_to :pet
  belongs_to :usuario
  attribute :nome_usuario, :string
  attribute :nome_pet, :string

  def nome_usuario
    usuario.nome
  end

  def nome_pet
    pet.nome
  end
end
