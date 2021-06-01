namespace :migrate do
  desc "TODO"
  task bills: :environment do
    Purchase.all.each do |purchase|
      bill = Bill.new
      bill.supplier = purchase.supplier
      bill.day = purchase.day
      bill.shipping_cost = purchase.shipping_cost
      bill.items_received = purchase.item_received
      bill.save!
      item = BillItem.new
      item.quantity = purchase.quantity
      item.price = purchase.price
      item.tps = purchase.tps
      item.tvq = purchase.tvq
      item.part = purchase.part
      item.bill = bill
      item.save!
    end
    puts "Done migrating purchases."
    Spending.all.each do |spending|
      bill = Bill.new
      bill.supplier = Supplier.first
      bill.day = spending.day
      bill.save!
      item = BillItem.new
      item.description = spending.description
      item.price = spending.cost
      item.bill = bill
      item.save!
    end
  end

end
