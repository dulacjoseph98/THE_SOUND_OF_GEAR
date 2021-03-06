class ReservationsController < ApplicationController
  def index
    policy_scope(Device)
    
    @reservations = current_user.reservations
    @resa_owner = current_user.devices.map {|device| device.reservations}
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
