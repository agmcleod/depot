class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :payment_type
  
  validates :name, :address, :email, :presence => true
  validates_associated :payment_type
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  def send_shipped_notification?(old_date)
    if old_date != self.ship_date
      true
    else
      false
    end
  end
  
  def line_items_out
    out = "<table><tbody>"
    self.line_items.each { |li| out = "#{out}<tr><td>#{li.quantity}&times;</td><td>#{li.product.title}</td></tr>" }
    "#{out}</tbody></table>".html_safe
  end
end
