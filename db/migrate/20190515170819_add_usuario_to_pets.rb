class AddUsuarioToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :usuario, foreign_key: true
    remove_column :pets, :id_usuario
  end
end
