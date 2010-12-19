require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  fixtures :orders
  fixtures :payment_types
  
  setup do
    @order = orders(:two)
  end
  
  test "order attributes must not be empty" do
    order = Order.new
    assert order.invalid?
    [:name, :address, :email, :payment_type_id].each do |sym|
      assert order.errors[sym].any?
    end
    
    # test fixture values
    File.open(File.join(Rails.root, 'out.txt'), 'w+') do |file|
      @order.errors.to_a.each {|msg| file.write "#{msg}\n"}
    end
    
    assert_equal @order.payment_type_id, payment_types(:check).id
    assert_not_equal @order.name, ''
    assert_not_equal @order.address, ''
    assert_not_equal @order.email, ''
    assert @order.valid?
  end
end