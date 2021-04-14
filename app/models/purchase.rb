class Purchase < ApplicationRecord
  belongs_to :part
  belongs_to :supplier
  
  def unitary_price
    price / quantity
  end
end
