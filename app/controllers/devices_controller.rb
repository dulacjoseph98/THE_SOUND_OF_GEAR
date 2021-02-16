class DevicesController < ApplicationController
  def index
    @devices = policy_scope(Device).order(created_at: :desc)
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

private

  def device_params
    params.require(:device).permit(:name, :category)
  end
end
