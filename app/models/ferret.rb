class Ferret < ApplicationRecord
    belongs_to :user, optional: true
   has_one_attached :picture
end
