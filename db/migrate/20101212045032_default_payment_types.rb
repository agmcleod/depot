class DefaultPaymentTypes < ActiveRecord::Migration
  def self.up
    PaymentType.create(:name => "Check")
    PaymentType.create(:name => "Credit card")
    PaymentType.create(:name => "Purchase Order")
  end

  def self.down
    PaymentType.destroy_all
  end
end
