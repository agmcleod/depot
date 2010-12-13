require 'test_helper'

class PaymentTypeTest < ActiveSupport::TestCase
  fixtures :payment_types
  setup do
    @check = payment_types(:check)
  end
  # Replace this with your real tests.
  test "name cannot be blank" do
    pt = PaymentType.new
    assert pt.invalid?
    
    assert @check.valid?
  end
end
