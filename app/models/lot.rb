class Lot < ApplicationRecord
  belongs_to :auction
  has_many :bids, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :starting_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def current_price
    bids.maximum(:amount) || starting_price
  end

  def winning_bid
    bids.order(amount: :desc).first
  end
end
