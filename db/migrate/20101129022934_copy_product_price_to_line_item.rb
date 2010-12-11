class CopyProductPriceToLineItem < ActiveRecord::Migration
  def self.up
    Product.all.each do |product|
      LineItem.where(:product_id => product.id).each do |line_item|
        line_item.update_attribute :price, product.price
      end
    end
  end

  def self.down
    LineItem.all.each { |li| li.update_attribute :price, nil }
  end
end