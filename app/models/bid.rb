class Bid < ApplicationRecord
  belongs_to :lot
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :amount_must_beat_current_price
  validate :auction_must_be_active

  private

  def amount_must_beat_current_price
    return unless amount && lot
    if amount <= lot.current_price
      errors.add(:amount, "must be greater than the current price of #{lot.current_price}")
    end
  end

  def auction_must_be_active
    return unless lot&.auction
    unless lot.auction.active?
      errors.add(:base, "This auction is not currently active")
    end
  end
end
