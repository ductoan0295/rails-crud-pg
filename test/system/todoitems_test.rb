require "application_system_test_case"

class TodoitemsTest < ApplicationSystemTestCase
  setup do
    @todoitem = todoitems(:one)
  end

  test "visiting the index" do
    visit todoitems_url
    assert_selector "h1", text: "Todoitems"
  end

  test "creating a Todoitem" do
    visit todoitems_url
    click_on "New Todoitem"

    check "Done" if @todoitem.done
    fill_in "Itemdescription", with: @todoitem.itemDescription
    fill_in "User", with: @todoitem.user_id
    click_on "Create Todoitem"

    assert_text "Todoitem was successfully created"
    click_on "Back"
  end

  test "updating a Todoitem" do
    visit todoitems_url
    click_on "Edit", match: :first

    check "Done" if @todoitem.done
    fill_in "Itemdescription", with: @todoitem.itemDescription
    fill_in "User", with: @todoitem.user_id
    click_on "Update Todoitem"

    assert_text "Todoitem was successfully updated"
    click_on "Back"
  end

  test "destroying a Todoitem" do
    visit todoitems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todoitem was successfully destroyed"
  end
end
