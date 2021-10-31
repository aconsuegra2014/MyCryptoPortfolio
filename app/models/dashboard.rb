class Dashboard

    def self.amount_by_crypto(crypto_id)
        Transaction.where(["crypto_currency_id = ?", crypto_id]).sum(:crypto_quantity)
    end

    def self.spent_per_crypto(crypto_id)
        Transaction.where(["crypto_currency_id = ?", crypto_id]).sum(:fiat_quantity)
    end

end