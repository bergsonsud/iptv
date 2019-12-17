require 'test_helper'

class MymailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymail = mymails(:one)
  end

  test "should get index" do
    get mymails_url
    assert_response :success
  end

  test "should get new" do
    get new_mymail_url
    assert_response :success
  end

  test "should create mymail" do
    assert_difference('Mymail.count') do
      post mymails_url, params: { mymail: { email: @mymail.email, expired: @mymail.expired } }
    end

    assert_redirected_to mymail_url(Mymail.last)
  end

  test "should show mymail" do
    get mymail_url(@mymail)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymail_url(@mymail)
    assert_response :success
  end

  test "should update mymail" do
    patch mymail_url(@mymail), params: { mymail: { email: @mymail.email, expired: @mymail.expired } }
    assert_redirected_to mymail_url(@mymail)
  end

  test "should destroy mymail" do
    assert_difference('Mymail.count', -1) do
      delete mymail_url(@mymail)
    end

    assert_redirected_to mymails_url
  end
end
