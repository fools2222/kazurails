require "application_system_test_case"

class KazmailsTest < ApplicationSystemTestCase
  setup do
    @kazmail = kazmails(:one)
  end

  test "visiting the index" do
    visit kazmails_url
    assert_selector "h1", text: "Kazmails"
  end

  test "creating a Kazmail" do
    visit kazmails_url
    click_on "New Kazmail"

    fill_in "Email", with: @kazmail.email
    fill_in "Message", with: @kazmail.message
    fill_in "Name", with: @kazmail.name
    click_on "Create Kazmail"

    assert_text "Kazmail was successfully created"
    click_on "Back"
  end

  test "updating a Kazmail" do
    visit kazmails_url
    click_on "Edit", match: :first

    fill_in "Email", with: @kazmail.email
    fill_in "Message", with: @kazmail.message
    fill_in "Name", with: @kazmail.name
    click_on "Update Kazmail"

    assert_text "Kazmail was successfully updated"
    click_on "Back"
  end

  test "destroying a Kazmail" do
    visit kazmails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kazmail was successfully destroyed"
  end
end
