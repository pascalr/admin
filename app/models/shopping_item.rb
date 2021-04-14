class ShoppingItem < ApplicationRecord
  belongs_to :supplier, optional: true
end
