class Purchase < ApplicationRecord
  belongs_to :part
  belongs_to :supplier
end
