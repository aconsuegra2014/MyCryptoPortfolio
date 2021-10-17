class Transaction < ApplicationRecord
  belongs_to :crypto_currency
  validates :crypto_quantity, presence: true
end
