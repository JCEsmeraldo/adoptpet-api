class Pedido < ApplicationRecord
  belongs_to :pet
  belongs_to :usuario
end
