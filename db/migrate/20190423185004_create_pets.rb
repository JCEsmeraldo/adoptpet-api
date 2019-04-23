class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :nome
      t.date :data_nasc
      t.string :genero

      t.timestamps
    end
  end
end
