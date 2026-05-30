class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction_and_lot

  def create
    @bid = @lot.bids.build(bid_params)
    @bid.user = current_user

    if @bid.save
      redirect_to auction_lot_path(@auction, @lot), notice: "Bid placed successfully!"
    else
      @bid_errors = @bid.errors.full_messages
      render "lots/show", status: :unprocessable_entity
    end
  end

  private

  def set_auction_and_lot
    @auction = Auction.find(params[:auction_id])
    @lot = @auction.lots.find(params[:lot_id])
  end

  def bid_params
    params.require(:bid).permit(:amount)
  end
end
