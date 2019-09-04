require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'relationships' do
    it { is_expected.to belong_to :customer }
  end

  context 'total cart price' do
    before(:each) do
      Customer.new(name: 'customer test').save
      Cart.new(customer_id: Customer.last.id).save
      Medicine.new(name: 'Rinosoro', value: 7.0, quantity: 30, stock: 30).save
    end

    it 'calculates total cart' do
      CartItem.new(cart_id: Cart.last.id, medicine_id: Medicine.last.id, quantity: 23).save
      expect(Cart.last.total_cart_price).to eql 161.0
    end
  end
end
