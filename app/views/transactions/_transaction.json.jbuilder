json.extract! transaction, :id, :crypto_quantity, :fiat_quantity, :date, :crypto_currency_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
