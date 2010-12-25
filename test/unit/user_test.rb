require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  setup do
    @user = users(:one)
  end
  test "invalid user" do
    user = User.new
    assert(user.invalid?)
  end
  
  test "name must be unique" do
    # users(:one)'s name is Dave
    user = User.new(:name => 'Dave')
    assert(!user.save)
  end
  
  test "passwords must match" do
    user = User.new(:name => 'newname', :password => 'secret', :password_confirmation => 'invalid')
    
    assert(user.invalid?)
  end
end
