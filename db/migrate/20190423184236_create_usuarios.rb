class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.string :rua
      t.string :cpf_cnpj
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :estado
      t.string :pais
      t.string :numero
      t.string :complemento
      t.string :telefone

      t.timestamps
    end
  end
end
