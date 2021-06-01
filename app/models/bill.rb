class Bill < ApplicationRecord
  belongs_to :supplier
  has_many :bill_items
  alias items bill_items
end
