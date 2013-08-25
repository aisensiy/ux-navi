require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
  end

  test "should create new item" do
    assert_difference "Item.count", 1 do
      post :create, item: FactoryGirl.attributes_for(:item)
    end
  end

end
