require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order attributes must not be empty" do
    order = Order.new
    assert order.invalid?
    [:name, :address, :email, :pay_type].each do |sym|
      assert order.errors[sym].any?
    end
  end
end
