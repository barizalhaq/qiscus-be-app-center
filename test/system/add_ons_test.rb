require "application_system_test_case"

class AddOnsTest < ApplicationSystemTestCase
  setup do
    @add_on = add_ons(:one)
  end

  test "visiting the index" do
    visit add_ons_url
    assert_selector "h1", text: "Add Ons"
  end

  test "creating a Add on" do
    visit add_ons_url
    click_on "New Add On"

    fill_in "Author", with: @add_on.author
    fill_in "Contact email", with: @add_on.contact_email
    fill_in "Description", with: @add_on.description
    fill_in "Name", with: @add_on.name
    click_on "Create Add on"

    assert_text "Add on was successfully created"
    click_on "Back"
  end

  test "updating a Add on" do
    visit add_ons_url
    click_on "Edit", match: :first

    fill_in "Author", with: @add_on.author
    fill_in "Contact email", with: @add_on.contact_email
    fill_in "Description", with: @add_on.description
    fill_in "Name", with: @add_on.name
    click_on "Update Add on"

    assert_text "Add on was successfully updated"
    click_on "Back"
  end

  test "destroying a Add on" do
    visit add_ons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Add on was successfully destroyed"
  end
end
