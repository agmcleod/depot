require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  fixtures :products
  fixtures :carts
  
  setup do
    @cart = carts(:one)
    @ruby = products(:ruby)
    @rails = products(:rails)
  end
  
  test "add_products_to_cart" do
    assert LineItem.create(:cart_id => @cart.id, :product_id => @ruby.id)
    assert LineItem.create(:cart_id => @cart.id, :product_id => @ruby.id)
    assert LineItem.create(:cart_id => @cart.id, :product_id => @rails.id)   
  end
end
