require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'relationships' do
    it { is_expected.to have_many :carts }
  end

  context 'name' do
    it 'titleize name' do
      c = Customer.new(name: 'name sample')
      expect(c.name).to eql 'Name Sample'
    end
  end
end
