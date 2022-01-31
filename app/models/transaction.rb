class Transaction < ApplicationRecord
  belongs_to :crypto_currency
  has_rich_text :note

  acts_as_taggable_on :tags

  validates :crypto_quantity, presence: true
end
