class ReservationsController < ApplicationController

  def new
    @reservation = current_user.reservations.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.total_price = (@reservation.end_date.to_date - @reservation.start_date.to_date ).to_i * @listing.price.to_i
    if @reservation.save
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      render :new
    end
  end


  def show
    @reservation = Reservation.find(params[:id])

  end

  def date

    render json: {message: "hello"}
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :listing_id, :total_price, :number_of_guest)
  end

end
