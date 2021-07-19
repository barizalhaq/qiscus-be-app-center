require "application_system_test_case"

class RequestDemosTest < ApplicationSystemTestCase
  setup do
    @request_demo = request_demos(:one)
  end

  test "visiting the index" do
    visit request_demos_url
    assert_selector "h1", text: "Request Demos"
  end

  test "creating a Request demo" do
    visit request_demos_url
    click_on "New Request Demo"

    fill_in "Add on", with: @request_demo.add_on_id
    fill_in "App", with: @request_demo.app_id
    fill_in "Contact email", with: @request_demo.contact_email
    fill_in "Contact phone", with: @request_demo.contact_phone
    click_on "Create Request demo"

    assert_text "Request demo was successfully created"
    click_on "Back"
  end

  test "updating a Request demo" do
    visit request_demos_url
    click_on "Edit", match: :first

    fill_in "Add on", with: @request_demo.add_on_id
    fill_in "App", with: @request_demo.app_id
    fill_in "Contact email", with: @request_demo.contact_email
    fill_in "Contact phone", with: @request_demo.contact_phone
    click_on "Update Request demo"

    assert_text "Request demo was successfully updated"
    click_on "Back"
  end

  test "destroying a Request demo" do
    visit request_demos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request demo was successfully destroyed"
  end
end
