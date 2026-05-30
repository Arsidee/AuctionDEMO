class LotsController < ApplicationController
  before_action :set_auction_and_lot

  def show
    @bid = Bid.new
  end

  private

  def set_auction_and_lot
    @auction = Auction.find(params[:auction_id])
    @lot = @auction.lots.find(params[:id])
  end
end
