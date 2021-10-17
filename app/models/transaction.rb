class Transaction < ApplicationRecord
  belongs_to :crypto_currency
  has_rich_text :note

  validates :crypto_quantity, presence: true
end
