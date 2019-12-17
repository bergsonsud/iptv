require 'test_helper'

class UrlLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url_link = url_links(:one)
  end

  test "should get index" do
    get url_links_url
    assert_response :success
  end

  test "should get new" do
    get new_url_link_url
    assert_response :success
  end

  test "should create url_link" do
    assert_difference('UrlLink.count') do
      post url_links_url, params: { url_link: { url: @url_link.url } }
    end

    assert_redirected_to url_link_url(UrlLink.last)
  end

  test "should show url_link" do
    get url_link_url(@url_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_link_url(@url_link)
    assert_response :success
  end

  test "should update url_link" do
    patch url_link_url(@url_link), params: { url_link: { url: @url_link.url } }
    assert_redirected_to url_link_url(@url_link)
  end

  test "should destroy url_link" do
    assert_difference('UrlLink.count', -1) do
      delete url_link_url(@url_link)
    end

    assert_redirected_to url_links_url
  end
end
