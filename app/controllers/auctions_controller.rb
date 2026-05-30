class AuctionsController < ApplicationController
  def index
    @auctions = Auction.order(start_time: :desc)
  end

  def show
    @auction = Auction.find(params[:id])
    @lots = @auction.lots
  end
end
