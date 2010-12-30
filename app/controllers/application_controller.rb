class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_i18n_locale_from_params
  protect_from_forgery
  private
  
  def current_cart
    begin
      Cart.find session[:cart_id]
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to(login_url, :notice => "Please log in to continue")
    end
  end
  
  def set_i18n_locale_from_params
    locale = current_locale 
    if !locale.nil?
      I18n.locale = locale
    else
      flash.now[:notice] = "#{params[:locale]} translation not available"
      logger.error(flash.now[:notice])
    end
  end
  
  def current_locale
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        params[:locale]
      else
        nil
      end
    end
  end
  
  def default_url_options
    { :locale => I18n.locale }
  end
end
