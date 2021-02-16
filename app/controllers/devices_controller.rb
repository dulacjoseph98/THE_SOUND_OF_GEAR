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
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to device_path(@device)
    else
      render :new
    end
  end

  def show
    @device = Device.find(params[:id])
  end

private

def device_params
  params.require(:device).permit(:name, :category)
end

end
