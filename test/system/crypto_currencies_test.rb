require "application_system_test_case"

class CryptoCurrenciesTest < ApplicationSystemTestCase
  setup do
    @crypto_currency = crypto_currencies(:one)
  end

  test "visiting the index" do
    visit crypto_currencies_url
    assert_selector "h1", text: "Crypto Currencies"
  end

  test "creating a Crypto currency" do
    visit crypto_currencies_url
    click_on "New Crypto Currency"

    fill_in "Name", with: @crypto_currency.name
    fill_in "Ticker symbol", with: @crypto_currency.ticker_symbol
    click_on "Create Crypto currency"

    assert_text "Crypto currency was successfully created"
    click_on "Back"
  end

  test "updating a Crypto currency" do
    visit crypto_currencies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @crypto_currency.name
    fill_in "Ticker symbol", with: @crypto_currency.ticker_symbol
    click_on "Update Crypto currency"

    assert_text "Crypto currency was successfully updated"
    click_on "Back"
  end

  test "destroying a Crypto currency" do
    visit crypto_currencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crypto currency was successfully destroyed"
  end
end
