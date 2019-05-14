class AlterFotoToPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :foto, :blob
  end
end
