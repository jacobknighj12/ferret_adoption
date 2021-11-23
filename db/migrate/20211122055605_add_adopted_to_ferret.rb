class AddAdoptedToFerret < ActiveRecord::Migration[6.1]
  def change
    add_column :ferrets, :adopted, :boolean
  end
end
