require "application_system_test_case"

class MymailsTest < ApplicationSystemTestCase
  setup do
    @mymail = mymails(:one)
  end

  test "visiting the index" do
    visit mymails_url
    assert_selector "h1", text: "Mymails"
  end

  test "creating a Mymail" do
    visit mymails_url
    click_on "New Mymail"

    fill_in "Email", with: @mymail.email
    fill_in "Expired", with: @mymail.expired
    click_on "Create Mymail"

    assert_text "Mymail was successfully created"
    click_on "Back"
  end

  test "updating a Mymail" do
    visit mymails_url
    click_on "Edit", match: :first

    fill_in "Email", with: @mymail.email
    fill_in "Expired", with: @mymail.expired
    click_on "Update Mymail"

    assert_text "Mymail was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymail" do
    visit mymails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymail was successfully destroyed"
  end
end
