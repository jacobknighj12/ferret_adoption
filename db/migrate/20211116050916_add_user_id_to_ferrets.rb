class AddUserIdToFerrets < ActiveRecord::Migration[6.1]
  def change
    add_reference :ferrets, :user, null: true, foreign_key: true
  end
end
