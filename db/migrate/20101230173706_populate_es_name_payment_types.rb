class PopulateEsNamePaymentTypes < ActiveRecord::Migration
  def self.up
    PaymentType.find_by_name("Check").update_attribute(:es_name, 'Cheque')
    PaymentType.find_by_name("Credit card").update_attribute(:es_name, "Tarjeta de cr&eacute;dito")
    PaymentType.find_by_name("Purchase Order").update_attribute(:es_name, "Orden de Compra")
  end

  def self.down
    ActiveRecord::Base.connection.execute('UPDATE payment_types SET es_name = null')
  end
end
