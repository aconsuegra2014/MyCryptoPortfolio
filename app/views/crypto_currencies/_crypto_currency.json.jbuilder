json.extract! crypto_currency, :id, :name, :ticker_symbol, :created_at, :updated_at
json.url crypto_currency_url(crypto_currency, format: :json)
