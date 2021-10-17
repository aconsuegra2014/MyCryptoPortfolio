class CreateCryptoCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :crypto_currencies do |t|
      t.string :name, null: false, limit: 50
      t.string :ticker_symbol, null: false, limit: 5

      t.timestamps
    end
  end
end
