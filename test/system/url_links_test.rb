require "application_system_test_case"

class UrlLinksTest < ApplicationSystemTestCase
  setup do
    @url_link = url_links(:one)
  end

  test "visiting the index" do
    visit url_links_url
    assert_selector "h1", text: "Url Links"
  end

  test "creating a Url link" do
    visit url_links_url
    click_on "New Url Link"

    fill_in "Url", with: @url_link.url
    click_on "Create Url link"

    assert_text "Url link was successfully created"
    click_on "Back"
  end

  test "updating a Url link" do
    visit url_links_url
    click_on "Edit", match: :first

    fill_in "Url", with: @url_link.url
    click_on "Update Url link"

    assert_text "Url link was successfully updated"
    click_on "Back"
  end

  test "destroying a Url link" do
    visit url_links_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Url link was successfully destroyed"
  end
end
