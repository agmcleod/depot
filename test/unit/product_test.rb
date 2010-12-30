require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # fixtures :products
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    [:title, :description, :price, :image_url].each do |sym|
      assert product.errors[sym].any?
    end    
  end
  
  test "product price must be positive" do
    product = Product.new(
      :title => 'My Book Title', 
      :description => 'yyy',
      :image_url => 'image.jpg',
      :locale => 'en'
    )
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')
      
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')
      
    product.price = 1
    assert product.valid?  
  end
  
  def new_product(image_url)
    Product.new(
      :title => 'My Book Title',
      :description => 'yyy',
      :price => 1,
      :image_url => image_url,
      :locale => 'en'
    )
  end
  
  test "image url" do
    ok = %w{ fred.gif Fred.gif fred.png fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end
    
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  
  test "product is not valid without a unique title" do
    product = Product.new(
      :title => products(:ruby).title,
      :description => 'yyy',
      :price => 1,
      :image_url => 'fred.gif',
      :locale => 'en'
    )
    
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end
  
  test "product title is atleast 10 characters" do
    product = Product.new(
      :title => 'Short',
      :description => 'yyy',
      :price => 10,
      :image_url => 'fake.jpg',
      :locale => 'en'
    )
    
    assert product.invalid?
    assert_equal "is too short (minimum is 10 characters)", product.errors[:title].join('; ')
  end
  
  test "product locale must be in one of the locales" do
    product = new_product('image.jpg')
    
    assert(product.valid?)
    
    product.locale = "lorem"
    assert(product.invalid?)
  end
end
