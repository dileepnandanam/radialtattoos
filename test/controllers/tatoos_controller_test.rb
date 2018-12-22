require 'test_helper'

class TatoosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tatoo = tatoos(:one)
  end

  test "should get index" do
    get tatoos_url
    assert_response :success
  end

  test "should get new" do
    get new_tatoo_url
    assert_response :success
  end

  test "should create tatoo" do
    assert_difference('Tatoo.count') do
      post tatoos_url, params: { tatoo: { premium: @tatoo.premium } }
    end

    assert_redirected_to tatoo_url(Tatoo.last)
  end

  test "should show tatoo" do
    get tatoo_url(@tatoo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tatoo_url(@tatoo)
    assert_response :success
  end

  test "should update tatoo" do
    patch tatoo_url(@tatoo), params: { tatoo: { premium: @tatoo.premium } }
    assert_redirected_to tatoo_url(@tatoo)
  end

  test "should destroy tatoo" do
    assert_difference('Tatoo.count', -1) do
      delete tatoo_url(@tatoo)
    end

    assert_redirected_to tatoos_url
  end
end
