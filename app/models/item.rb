class Item < ApplicationRecord
    belongs_to :user, optional: true 
    has_one :category, optional: true 
end
