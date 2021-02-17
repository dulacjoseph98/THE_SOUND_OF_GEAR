class DevicesController < ApplicationController
  def index
    if params[:query].present?
      if params[:query][:address] != "" && params[:query][:category] != ""
        @devices = policy_scope(Device).where('lower(location) = ?', params[:query][:address].downcase).where('lower(category) = ?', params[:query][:category].downcase)
      elsif params[:query][:address] != ""
        @devices = policy_scope(Device).where('lower(location) = ?', params[:query][:address].downcase)
      elsif params[:query][:category] != ""
        @devices = policy_scope(Device).where('lower(category) = ?', params[:query][:category].downcase)
      end
      # @devices = Device.where('lower(location) = ?', params[:location].downcase)
    else
      @devices = policy_scope(Device)
    end
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @devices.geocoded.map do |device|
      {
        lat: device.latitude,
        lng: device.longitude
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
