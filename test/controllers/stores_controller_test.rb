require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { average_sales: @store.average_sales, category: @store.category, contact: @store.contact, description: @store.description, facebook_page: @store.facebook_page, location: @store.location, name: @store.name, store_hours: @store.store_hours, twitter_page: @store.twitter_page, website: @store.website }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, store: { average_sales: @store.average_sales, category: @store.category, contact: @store.contact, description: @store.description, facebook_page: @store.facebook_page, location: @store.location, name: @store.name, store_hours: @store.store_hours, twitter_page: @store.twitter_page, website: @store.website }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
