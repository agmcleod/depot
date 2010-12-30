class StoreController < ApplicationController
  skip_before_filter(:authorize)
  def index
    if params[:set_locale]
      redirect_to(store_path(:locale => params[:set_locale]))
    else
      l = current_locale || 'en'
      @products = Product.where(:locale => l)
      @cart = current_cart
    end
  end

end
