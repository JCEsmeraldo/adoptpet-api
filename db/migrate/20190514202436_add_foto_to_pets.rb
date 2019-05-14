class AddFotoToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :foto, :string
  end
end
