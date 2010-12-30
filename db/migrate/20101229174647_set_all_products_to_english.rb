class SetAllProductsToEnglish < ActiveRecord::Migration
  def self.up
    Product.all.each { |p| p.update_attribute(:locale, 'en') }
  end

  def self.down
    Product.all.each { |p| p.update_attribute(:locale, nil) }
  end
end
