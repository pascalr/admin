class Purchase < ApplicationRecord
  belongs_to :part
  belongs_to :supplier
  
  def unitary_price
    price / quantity
  end

  def total_cost
    (price || 0) + (shipping_cost || 0) + (tps || 0) + (tvq || 0)
  end
end
