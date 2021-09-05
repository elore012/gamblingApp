require "application_system_test_case"

class TransactionhistoriesTest < ApplicationSystemTestCase
  setup do
    @transactionhistory = transactionhistories(:one)
  end

  test "visiting the index" do
    visit transactionhistories_url
    assert_selector "h1", text: "Transactionhistories"
  end

  test "creating a Transactionhistory" do
    visit transactionhistories_url
    click_on "New Transactionhistory"

    click_on "Create Transactionhistory"

    assert_text "Transactionhistory was successfully created"
    click_on "Back"
  end

  test "updating a Transactionhistory" do
    visit transactionhistories_url
    click_on "Edit", match: :first

    click_on "Update Transactionhistory"

    assert_text "Transactionhistory was successfully updated"
    click_on "Back"
  end

  test "destroying a Transactionhistory" do
    visit transactionhistories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transactionhistory was successfully destroyed"
  end
end
