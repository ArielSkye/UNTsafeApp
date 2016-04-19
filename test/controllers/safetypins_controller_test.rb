require 'test_helper'

class SafetypinsControllerTest < ActionController::TestCase
  setup do
    @safetypin = safetypins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safetypins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safetypin" do
    assert_difference('Safetypin.count') do
      post :create, safetypin: { address: @safetypin.address, description: @safetypin.description, latitude: @safetypin.latitude, longitude: @safetypin.longitude }
    end

    assert_redirected_to safetypin_path(assigns(:safetypin))
  end

  test "should show safetypin" do
    get :show, id: @safetypin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safetypin
    assert_response :success
  end

  test "should update safetypin" do
    patch :update, id: @safetypin, safetypin: { address: @safetypin.address, description: @safetypin.description, latitude: @safetypin.latitude, longitude: @safetypin.longitude }
    assert_redirected_to safetypin_path(assigns(:safetypin))
  end

  test "should destroy safetypin" do
    assert_difference('Safetypin.count', -1) do
      delete :destroy, id: @safetypin
    end

    assert_redirected_to safetypins_path
  end
end
