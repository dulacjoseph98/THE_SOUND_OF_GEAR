class DevicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @devices = policy_scope(Device)

    if params[:name].present?
      @devices = @devices.global_search(params[:name])
    end

    if params[:category].present?
      @devices = @devices.global_search(params[:category])
    end

    if params[:address].present?
      @devices = @devices.near(params[:address], 10)
    end

    @markers = @devices.geocoded.map do |device|
      {
        lat: device.latitude,
        lng: device.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { device: device }),
        image_url: helpers.asset_url('logo_red')
      }
    end
  end

  def new
    @device = Device.new
    authorize @device
  end

  def create
    @device = Device.new(device_params)
    @user = current_user
    @device.user = @user
    authorize @device
    if @device.save
      redirect_to device_path(@device)
    else
      render :new
    end
  end

  def show
    @device = Device.find(params[:id])
    authorize @device

    @reservation = Reservation.new
    # authorize @reservation
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    authorize @device
    redirect_to devices_path(@device)
  end

  private

  def device_params
    params.require(:device).permit(:name, :category, :photo, :address)
  end
end
