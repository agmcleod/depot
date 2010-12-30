class AddEsNameToPaymentTypes < ActiveRecord::Migration
  def self.up
    add_column :payment_types, :es_name, :string
  end

  def self.down
    remove_column :payment_types, :es_name
  end
end
