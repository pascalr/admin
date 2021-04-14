class Part < ApplicationRecord
  #belongs_to :part, optional: true
  #has_many :parts
  has_many :part_list_items
  has_many :subparts, :through => :part_list_items, :source => 'item', class_name: 'Part'
  #has_many :using_parts, :through => :part_hierarchies, :source => 'part', class_name: 'Part'
  has_many :purchases

  accepts_nested_attributes_for :part_list_items
  
  def to_param
    "#{id}-#{name}"
  end

  def parts_where_used
    Part.joins(:part_list_items).where(:part_list_items => {item_id: id}).all
  end

  def lattest_purchase
    @lattest_purchase ||= purchases.order(:day).first
  end

  def price
    if lattest_purchase
      return lattest_purchase.unitary_price
    elsif not subparts.blank?
      return part_list_items.map(&:price).sum
    end
    0 
  end

  def all_part_list_items_combined

    items = all_part_list_items
    part_list_hash = items.each_with_object({}) { |item, h|
      h[item.item_id] = item.quantity + (h[item.item_id] || 0)
    }
    part_list_hash.map {|k,v|
      item = PartListItem.new
      item.item_id = k
      item.quantity = v
      item
    }.sort_by {|i| i.item.name}
  end

  def all_part_list_items
    return [] if part_list_items.blank?
    (part_list_items.map { |item|
      nested = item.item.all_part_list_items
      nested.blank? ? item : nested
    }).flatten
  end

  def min_parts_list
    4.times { subparts.build }
    subparts
  end
end
