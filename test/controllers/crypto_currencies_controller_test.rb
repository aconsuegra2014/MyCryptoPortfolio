require "test_helper"

class CryptoCurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto_currency = crypto_currencies(:one)
  end

  test "should get index" do
    get crypto_currencies_url
    assert_response :success
  end

  test "should get new" do
    get new_crypto_currency_url
    assert_response :success
  end

  test "should create crypto_currency" do
    assert_difference('CryptoCurrency.count') do
      post crypto_currencies_url, params: { crypto_currency: { name: @crypto_currency.name, ticker_symbol: @crypto_currency.ticker_symbol } }
    end

    assert_redirected_to crypto_currency_url(CryptoCurrency.last)
  end

  test "should show crypto_currency" do
    get crypto_currency_url(@crypto_currency)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypto_currency_url(@crypto_currency)
    assert_response :success
  end

  test "should update crypto_currency" do
    patch crypto_currency_url(@crypto_currency), params: { crypto_currency: { name: @crypto_currency.name, ticker_symbol: @crypto_currency.ticker_symbol } }
    assert_redirected_to crypto_currency_url(@crypto_currency)
  end

  test "should destroy crypto_currency" do
    assert_difference('CryptoCurrency.count', -1) do
      delete crypto_currency_url(@crypto_currency)
    end

    assert_redirected_to crypto_currencies_url
  end
end
