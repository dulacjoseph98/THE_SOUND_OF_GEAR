class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  def new
    @reservation = Reservation.new
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end
  def show
    @reservation = Reservation.find(params[:id])
  end

private

def reservation_params
  params.require(:reservation).permit(:start_date, :end_date)
end
end
