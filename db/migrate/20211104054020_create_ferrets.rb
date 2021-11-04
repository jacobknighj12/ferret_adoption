class CreateFerrets < ActiveRecord::Migration[6.1]
  def change
    create_table :ferrets do |t|
      t.string :name
      t.integer :age
      t.string :disposition

      t.timestamps
    end
  end
end
