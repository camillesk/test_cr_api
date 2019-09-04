class Customer < ApplicationRecord
  has_many :carts

  before_save :transform_name

  def transform_name
    transformed_name = name.titleize

    write_attribute(:name, transformed_name)
  end
end
