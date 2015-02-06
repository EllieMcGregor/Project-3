require 'test_helper'

class FoodItemsControllerTest < ActionController::TestCase
  setup do
    @food_item = food_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_item" do
    assert_difference('FoodItem.count') do
      post :create, food_item: { expiry_date: @food_item.expiry_date, food_item_image: @food_item.food_item_image, name: @food_item.name, user_id: @food_item.user_id }
    end

    assert_redirected_to food_item_path(assigns(:food_item))
  end

  test "should show food_item" do
    get :show, id: @food_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_item
    assert_response :success
  end

  test "should update food_item" do
    patch :update, id: @food_item, food_item: { expiry_date: @food_item.expiry_date, food_item_image: @food_item.food_item_image, name: @food_item.name, user_id: @food_item.user_id }
    assert_redirected_to food_item_path(assigns(:food_item))
  end

  test "should destroy food_item" do
    assert_difference('FoodItem.count', -1) do
      delete :destroy, id: @food_item
    end

    assert_redirected_to food_items_path
  end
end
