class PartListItem < ApplicationRecord
  belongs_to :part
  belongs_to :item, class_name: "Part"
  
  def price
    quantity * item.price
  end
end
