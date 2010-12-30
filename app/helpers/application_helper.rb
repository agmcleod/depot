module ApplicationHelper
  def current_locale
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        params[:locale]
      else
        nil
      end
    end
  end
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = 'display:none'
    end
    content_tag 'div', attributes, &block
  end
  
  def price_after_conversion(price)
    l = 1.0
    LANGUAGES.each do |lang|
      l = lang if lang[1] == current_locale.to_s
    end
    Rails.logger.debug("price: #{price} | l: #{l[2]}")
    price * l[2]
  end
end
