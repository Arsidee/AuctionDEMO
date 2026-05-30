module Admin
  class LotsController < BaseController
    before_action :set_auction
    before_action :set_lot, only: [:show, :edit, :update, :destroy]

    def index
      @lots = @auction.lots
    end

    def show
    end

    def new
      @lot = @auction.lots.build
    end

    def create
      @lot = @auction.lots.build(lot_params)
      if @lot.save
        redirect_to admin_auction_lot_path(@auction, @lot), notice: "Lot created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @lot.update(lot_params)
        redirect_to admin_auction_lot_path(@auction, @lot), notice: "Lot updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @lot.destroy
      redirect_to admin_auction_path(@auction), notice: "Lot deleted."
    end

    private

    def set_auction
      @auction = Auction.find(params[:auction_id])
    end

    def set_lot
      @lot = @auction.lots.find(params[:id])
    end

    def lot_params
      params.require(:lot).permit(:name, :description, :starting_price, :image)
    end
  end
end
