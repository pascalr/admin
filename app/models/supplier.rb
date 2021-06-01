class Supplier < ApplicationRecord
  has_many :purchases
  has_many :shopping_items
  has_many :bills
end
