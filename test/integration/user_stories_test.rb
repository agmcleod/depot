require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products, :payment_types

  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby)
    
    # User goes to the index
    get '/'
    assert_response(:success)
    assert_template('index')
    
    # User adds a product to the cart
    xml_http_request(:post, '/line_items', :product_id => ruby_book.id)
    assert_response(:success)
    
    # Was it added?
    cart = Cart.find(session[:cart_id])
    assert_equal(1, cart.line_items.size)
    assert_equal(ruby_book, cart.line_items[0].product)
    
    # The user checks out
    get '/orders/new'
    assert_response(:success)
    assert_template('new')
    # post their info
    post_via_redirect('/orders', :order => {
      :name => 'Aaron McLeod',
      :address => '123 The street',
      :email => 'fake@test.com',
      :payment_type_id => payment_types(:check).id
    })
    # check the response
    assert_response(:success)
    assert_template('index')
    cart = Cart.find(session[:cart_id])
    assert_equal(0, cart.line_items.size)
    
    orders = Order.all
    assert_equal(1, orders.size)
    order = orders[0]
    
    assert_equal('Aaron McLeod', order.name)
    assert_equal('123 The street', order.address)
    assert_equal('fake@test.com', order.email)
    assert_equal('Pay Check', order.payment_type.name)
    
    assert_equal(1, order.line_items.size)
    line_item = order.line_items[0]
    assert_equal(ruby_book, line_item.product)
    
    mail = ActionMailer::Base.deliveries.last
    assert_equal(['fake@test.com'], mail.to)
    assert_equal('John Smith depot@pragmaticdepot.com', mail[:from].value)
    assert_equal('Pragmatic Store Order Confirmation', mail.subject)
  end
end
