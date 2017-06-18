require 'test_helper'

class OrderServicesControllerTest < ActionController::TestCase
  setup do
    @order_service = order_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_service" do
    assert_difference('OrderService.count') do
      post :create, order_service: { order_id: @order_service.order_id, service_id: @order_service.service_id }
    end

    assert_redirected_to order_service_path(assigns(:order_service))
  end

  test "should show order_service" do
    get :show, id: @order_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_service
    assert_response :success
  end

  test "should update order_service" do
    patch :update, id: @order_service, order_service: { order_id: @order_service.order_id, service_id: @order_service.service_id }
    assert_redirected_to order_service_path(assigns(:order_service))
  end

  test "should destroy order_service" do
    assert_difference('OrderService.count', -1) do
      delete :destroy, id: @order_service
    end

    assert_redirected_to order_services_path
  end
end
