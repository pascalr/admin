class BillItem < ApplicationRecord
  belongs_to :bill
  belongs_to :part, optional: true
end
