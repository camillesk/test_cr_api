require 'rails_helper'

RSpec.describe CartItem, type: :model do
  context 'relationships' do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :medicine }
  end

  context 'add to cart' do
    before(:each) do
      Customer.new(name: 'customer test').save
      Cart.new(customer_id: Customer.last.id).save
      Medicine.new(name: 'Rinosoro', value: 7.0, quantity: 30, stock: 30).save
    end

    it 'dont save when not enough stock' do
      expect(CartItem.count).to eql 0
      CartItem.new(cart_id: Cart.last.id, medicine_id: Medicine.last.id, quantity: 31).save
      expect(CartItem.count).to eql 0
    end

    it 'remove from stock' do
      CartItem.new(cart_id: Cart.last.id, medicine_id: Medicine.last.id, quantity: 5).save
      expect(Medicine.last.stock).to eql 25
    end
  end
end
