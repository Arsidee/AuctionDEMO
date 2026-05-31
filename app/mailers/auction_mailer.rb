class AuctionMailer < ApplicationMailer
  def winner_notification(user, lot)
    @user = user
    @lot = lot
    @auction = lot.auction
    @winning_bid = lot.winning_bid

    mail(to: @user.email, subject: "You won: #{@lot.name} in #{@auction.name}!")
  end
end
