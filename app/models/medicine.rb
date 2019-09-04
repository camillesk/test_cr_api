class Medicine < ApplicationRecord
  def total
    value.to_f * quantity
  end
end
