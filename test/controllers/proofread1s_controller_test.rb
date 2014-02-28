require 'test_helper'

class Proofread1sControllerTest < ActionController::TestCase
  setup do
    @proofread1 = proofread1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proofread1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proofread1" do
    assert_difference('Proofread1.count') do
      post :create, proofread1: {  }
    end

    assert_redirected_to proofread1_path(assigns(:proofread1))
  end

  test "should show proofread1" do
    get :show, id: @proofread1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proofread1
    assert_response :success
  end

  test "should update proofread1" do
    patch :update, id: @proofread1, proofread1: {  }
    assert_redirected_to proofread1_path(assigns(:proofread1))
  end

  test "should destroy proofread1" do
    assert_difference('Proofread1.count', -1) do
      delete :destroy, id: @proofread1
    end

    assert_redirected_to proofread1s_path
  end
end
