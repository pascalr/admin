class BillItem < ApplicationRecord
  belongs_to :bill
  belongs_to :part, optional: true

  def price_with_taxes
    self.price + (self.tps || 0.0) + (self.tvq || 0.0)
  end
end
