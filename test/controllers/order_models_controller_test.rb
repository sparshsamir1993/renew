require 'test_helper'

class OrderModelsControllerTest < ActionController::TestCase
  setup do
    @order_model = order_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_model" do
    assert_difference('OrderModel.count') do
      post :create, order_model: { model_id: @order_model.model_id, order_id: @order_model.order_id }
    end

    assert_redirected_to order_model_path(assigns(:order_model))
  end

  test "should show order_model" do
    get :show, id: @order_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_model
    assert_response :success
  end

  test "should update order_model" do
    patch :update, id: @order_model, order_model: { model_id: @order_model.model_id, order_id: @order_model.order_id }
    assert_redirected_to order_model_path(assigns(:order_model))
  end

  test "should destroy order_model" do
    assert_difference('OrderModel.count', -1) do
      delete :destroy, id: @order_model
    end

    assert_redirected_to order_models_path
  end
end
