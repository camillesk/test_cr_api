class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :medicine

  validates :cart_id, :medicine_id, :quantity, presence: true
  validate :stock_positive, :stock_qty

  after_save :remove_from_stock

  private

  def stock_positive
    med = Medicine.find(medicine_id)

    errors.add(:quantity, 'Out of order') unless med.stock.positive?
  end

  def stock_qty
    med = Medicine.find(medicine_id)

    errors.add(:quantity, 'Not enough stock') unless (med.stock - quantity).positive?
  end

  def remove_from_stock
    med = Medicine.find(medicine_id)

    med.stock -= quantity
    med.save
  end
end
