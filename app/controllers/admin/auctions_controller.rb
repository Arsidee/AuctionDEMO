module Admin
  class AuctionsController < BaseController
    before_action :set_auction, only: [:show, :edit, :update, :destroy]

    def index
      @auctions = Auction.order(start_time: :desc)
    end

    def show
      @lots = @auction.lots
    end

    def new
      @auction = Auction.new
    end

    def create
      @auction = Auction.new(auction_params)
      if @auction.save
        redirect_to admin_auction_path(@auction), notice: "Auction created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @auction.update(auction_params)
        redirect_to admin_auction_path(@auction), notice: "Auction updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @auction.destroy
      redirect_to admin_auctions_path, notice: "Auction deleted."
    end

    private

    def set_auction
      @auction = Auction.find(params[:id])
    end

    def auction_params
      params.require(:auction).permit(:name, :description, :start_time, :end_time)
    end
  end
end
