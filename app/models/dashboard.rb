class Dashboard

    def self.amount_by_crypto(crypto_id, tag)
        transactions = Transaction.where(["crypto_currency_id = ?", crypto_id])
        unless tag.nil?
            transactions = transactions.tagged_with(tag)
        end
        transactions.sum(:crypto_quantity)
    end

    def self.spent_per_crypto(crypto_id, tag)
        transactions = Transaction.where(["crypto_currency_id = ?", crypto_id])
        unless tag.nil?
            transactions = transactions.tagged_with(tag)
        end
        transactions.sum(:fiat_quantity)
    end

end