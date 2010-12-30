class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  has_many :orders, :through => :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Cannot delete product, as it is currently in one or more carts')
    end
  end
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true, :length => { :minimum => 10 }
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a url for GIF, JPG or PNG'
  }
  validates :locale, :inclusion => { :in => LANGUAGES.collect { |l| l[1] } }
end