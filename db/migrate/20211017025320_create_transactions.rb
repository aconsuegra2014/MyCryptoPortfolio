class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :crypto_quantity
      t.decimal :fiat_quantity
      t.date :date
      t.references :crypto_currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
