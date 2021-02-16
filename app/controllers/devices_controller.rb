class DevicesController < ApplicationController
  def index
    if params[:location].present?
      @devices = Device.where('lower(location) = ?', params[:location].downcase)
    else
      @devices = Device.all
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
    params.require(:device).permit(:name, :category)
  end
end
