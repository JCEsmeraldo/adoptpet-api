class CreatePedidoAdocaos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedido_adocaos do |t|
      t.integer :id_pet
      t.integer :id_usuario
      t.string :status

      t.timestamps
    end
  end
end
