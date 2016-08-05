require 'test_helper'

class StoreOrdersControllerTest < ActionController::TestCase
  setup do
    @store_order = store_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_order" do
    assert_difference('StoreOrder.count') do
      post :create, store_order: { status: @store_order.status, total_cost: @store_order.total_cost }
    end

    assert_redirected_to store_order_path(assigns(:store_order))
  end

  test "should show store_order" do
    get :show, id: @store_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_order
    assert_response :success
  end

  test "should update store_order" do
    patch :update, id: @store_order, store_order: { status: @store_order.status, total_cost: @store_order.total_cost }
    assert_redirected_to store_order_path(assigns(:store_order))
  end

  test "should destroy store_order" do
    assert_difference('StoreOrder.count', -1) do
      delete :destroy, id: @store_order
    end

    assert_redirected_to store_orders_path
  end
end
