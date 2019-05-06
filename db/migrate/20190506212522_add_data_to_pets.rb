class AddDataToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :especie, :string
    add_column :pets, :descricao, :string
    add_column :pets, :id_usuario, :integer
  end
end
