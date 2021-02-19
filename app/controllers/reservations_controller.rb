class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @reservation.user = current_user
    @device = Device.find(params[:device_id])
    @reservation.device = @device
    if @reservation.save
      redirect_to device_reservation_path(@device, @reservation)
    else
      render "devices/show"
    end
  end
  def show
    @device = Device.find(params[:device_id])
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
