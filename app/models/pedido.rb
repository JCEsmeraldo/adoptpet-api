class Pedido < ApplicationRecord
  belongs_to :pet
  belongs_to :usuario
  attribute :nome_usuario, :string
  attribute :nome_pet, :string
  attribute :email_usuario, :string

  def nome_usuario
    usuario.nome
  end

  def email_usuario
    usuario.email
  end

  def nome_pet
    pet.nome
  end

  def nome_pet
    pet.nome
  end
end
