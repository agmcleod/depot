class Notifier < ActionMailer::Base
  default(:from => "John Smith depot@pragmaticdepot.com")

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    mail(:to => order.email, :subject => 'Pragmatic Store Order Confirmation')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    mail(:to => order.email, :subject => 'Pragmatic Store Order Shipped')
  end
  
  def order_ship_date_updated(order)
    @order = order
    mail(:to => order.email, :subject => 'Shipped date has been updated')
  end
  
  def notify_admin_of_error(msg)
    mail(:to => 'sircoolguy99@gmail.com', :subject => 'An error has occured', :body => 'The following error has occured: ' + msg)
  end
end
