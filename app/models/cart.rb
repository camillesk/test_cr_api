class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items

  def total_cart_price
    total = 0
    CartItem.all.map do |item|
      med = Medicine.find(item.medicine_id)
      total = item.quantity * med.value
    end

    total
  end
end
