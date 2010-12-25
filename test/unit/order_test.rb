require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  fixtures :orders, :payment_types
  
  setup do
    @order = orders(:one)
  end
  
  test "order attributes must not be empty" do
    order = Order.new
    assert order.invalid?
    [:name, :address, :email].each do |sym|
      assert order.errors[sym].any?
    end
    
    assert_equal @order.payment_type_id, payment_types(:check).id
    assert_not_equal @order.name, ''
    assert_not_equal @order.address, ''
    assert_not_equal @order.email, ''
    assert @order.valid?
  end
end