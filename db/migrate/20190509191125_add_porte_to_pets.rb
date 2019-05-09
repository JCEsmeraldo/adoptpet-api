class AddPorteToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :porte, :string
  end
end
