class Pet < ApplicationRecord
  belongs_to :usuario
  attribute :dono, :string
  def dono
    usuario.nome
  end
end
