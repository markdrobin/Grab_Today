require 'test_helper'

class StoreOrderItemsControllerTest < ActionController::TestCase
  setup do
    @store_order_item = store_order_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_order_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_order_item" do
    assert_difference('StoreOrderItem.count') do
      post :create, store_order_item: { price: @store_order_item.price, quantity: @store_order_item.quantity }
    end

    assert_redirected_to store_order_item_path(assigns(:store_order_item))
  end

  test "should show store_order_item" do
    get :show, id: @store_order_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_order_item
    assert_response :success
  end

  test "should update store_order_item" do
    patch :update, id: @store_order_item, store_order_item: { price: @store_order_item.price, quantity: @store_order_item.quantity }
    assert_redirected_to store_order_item_path(assigns(:store_order_item))
  end

  test "should destroy store_order_item" do
    assert_difference('StoreOrderItem.count', -1) do
      delete :destroy, id: @store_order_item
    end

    assert_redirected_to store_order_items_path
  end
end
