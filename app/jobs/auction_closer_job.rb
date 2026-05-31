class AuctionCloserJob < ApplicationJob
  queue_as :default

  def perform
    Auction.pending_close.each do |auction|
      auction.lots.each do |lot|
        winner = lot.winning_bid&.user
        next unless winner

        AuctionMailer.winner_notification(winner, lot).deliver_now

        winner.notifications.create!(
          lot: lot,
          message: "You won \"#{lot.name}\" in #{auction.name} with a bid of $#{"%.2f" % lot.winning_bid.amount}!"
        )
      end

      auction.update!(closed: true)
    end
  end
end
