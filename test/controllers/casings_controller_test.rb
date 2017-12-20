require 'test_helper'

class CasingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casing = casings(:one)
  end

  test "should get index" do
    get casings_url
    assert_response :success
  end

  test "should get new" do
    get new_casing_url
    assert_response :success
  end

  test "should create casing" do
    assert_difference('Casing.count') do
      post casings_url, params: { casing: { game_id: @casing.game_id, score: @casing.score, try1: @casing.try1, try2: @casing.try2, turn: @casing.turn, user_id: @casing.user_id } }
    end

    assert_redirected_to casing_url(Casing.last)
  end

  test "should show casing" do
    get casing_url(@casing)
    assert_response :success
  end

  test "should get edit" do
    get edit_casing_url(@casing)
    assert_response :success
  end

  test "should update casing" do
    patch casing_url(@casing), params: { casing: { game_id: @casing.game_id, score: @casing.score, try1: @casing.try1, try2: @casing.try2, turn: @casing.turn, user_id: @casing.user_id } }
    assert_redirected_to casing_url(@casing)
  end

  test "should destroy casing" do
    assert_difference('Casing.count', -1) do
      delete casing_url(@casing)
    end

    assert_redirected_to casings_url
  end
end
