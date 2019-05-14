class AlterPetsFoto < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :foto, :longblob
  end
end
