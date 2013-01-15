require 'test_helper'

class BreakersControllerTest < ActionController::TestCase
  setup do
    @breaker = breakers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breakers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breaker" do
    assert_difference('Breaker.count') do
      post :create, breaker: { address: @breaker.address, bboying_since: @breaker.bboying_since, birthday: @breaker.birthday, country: @breaker.country, email: @breaker.email, favorite_character: @breaker.favorite_character, name: @breaker.name, password: @breaker.password, province: @breaker.province, region: @breaker.region }
    end

    assert_redirected_to breaker_path(assigns(:breaker))
  end

  test "should show breaker" do
    get :show, id: @breaker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @breaker
    assert_response :success
  end

  test "should update breaker" do
    put :update, id: @breaker, breaker: { address: @breaker.address, bboying_since: @breaker.bboying_since, birthday: @breaker.birthday, country: @breaker.country, email: @breaker.email, favorite_character: @breaker.favorite_character, name: @breaker.name, password: @breaker.password, province: @breaker.province, region: @breaker.region }
    assert_redirected_to breaker_path(assigns(:breaker))
  end

  test "should destroy breaker" do
    assert_difference('Breaker.count', -1) do
      delete :destroy, id: @breaker
    end

    assert_redirected_to breakers_path
  end
end
