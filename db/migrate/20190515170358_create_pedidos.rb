class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.references :pet, foreign_key: true
      t.references :usuario, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
