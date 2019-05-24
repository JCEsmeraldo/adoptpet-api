class AddAdotadoToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adotado, :boolean
  end
end
