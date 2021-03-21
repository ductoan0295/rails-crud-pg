require "application_system_test_case"

class ToDoItemsTest < ApplicationSystemTestCase
  setup do
    @to_do_item = to_do_items(:one)
  end

  test "visiting the index" do
    visit to_do_items_url
    assert_selector "h1", text: "To Do Items"
  end

  test "creating a To do item" do
    visit to_do_items_url
    click_on "New To Do Item"

    fill_in "User", with: @to_do_item.User_id
    fill_in "Itemdescription", with: @to_do_item.itemDescription
    fill_in "Prioritynumber", with: @to_do_item.priorityNumber
    click_on "Create To do item"

    assert_text "To do item was successfully created"
    click_on "Back"
  end

  test "updating a To do item" do
    visit to_do_items_url
    click_on "Edit", match: :first

    fill_in "User", with: @to_do_item.User_id
    fill_in "Itemdescription", with: @to_do_item.itemDescription
    fill_in "Prioritynumber", with: @to_do_item.priorityNumber
    click_on "Update To do item"

    assert_text "To do item was successfully updated"
    click_on "Back"
  end

  test "destroying a To do item" do
    visit to_do_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "To do item was successfully destroyed"
  end
end
