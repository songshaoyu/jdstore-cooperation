class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ai = cart_items.new
    ai.product = product
    ai.quantity = 1
    ai.save
  end
end
