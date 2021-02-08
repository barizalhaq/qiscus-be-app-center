require 'test_helper'

class RequestDemosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_demo = request_demos(:one)
  end

  test "should get index" do
    get request_demos_url
    assert_response :success
  end

  test "should get new" do
    get new_request_demo_url
    assert_response :success
  end

  test "should create request_demo" do
    assert_difference('RequestDemo.count') do
      post request_demos_url, params: { request_demo: { add_on_id: @request_demo.add_on_id, app_id: @request_demo.app_id, contact_email: @request_demo.contact_email, contact_phone: @request_demo.contact_phone } }
    end

    assert_redirected_to request_demo_url(RequestDemo.last)
  end

  test "should show request_demo" do
    get request_demo_url(@request_demo)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_demo_url(@request_demo)
    assert_response :success
  end

  test "should update request_demo" do
    patch request_demo_url(@request_demo), params: { request_demo: { add_on_id: @request_demo.add_on_id, app_id: @request_demo.app_id, contact_email: @request_demo.contact_email, contact_phone: @request_demo.contact_phone } }
    assert_redirected_to request_demo_url(@request_demo)
  end

  test "should destroy request_demo" do
    assert_difference('RequestDemo.count', -1) do
      delete request_demo_url(@request_demo)
    end

    assert_redirected_to request_demos_url
  end
end
