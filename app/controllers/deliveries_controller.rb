class DeliveriesController < ApplicationController
  def index
    @q = Delivery.ransack(params[:q])
    @deliveries = @q.result.order(created_at: :desc).page(params[:page]).per(10)
    @total_cost = @q.result.sum(:cost)
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)

    @delivery.pickup_address = "#{params["pickup address-search"].strip}, #{params["pickup-city"]}, #{params["pickup-state"]}, #{params["pickup-zip"]}"
    @delivery.delivery_address = "#{params["delivery address-search"].strip}, #{params["delivery-city"]}, #{params["delivery-state"]}, #{params["delivery-zip"]}"

    if @delivery.save
      flash[:notice] = "Your delivery has been successfully scheduled."
      redirect_to deliveries_path
    else
      @delivery.pickup_address = ""
      @delivery.delivery_address = ""

      @q = Delivery.ransack(params[:q])
      @deliveries = @q.result.order(created_at: :desc).page(params[:page]).per(10)
      @total_cost = @q.result.sum(:cost)

      flash[:alert] = "Something went wrong... Please try again."
      render :index, status: :unprocessable_entity
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:weight, :scheduled_time, :pickup_address, :delivery_address, :driver_name, "pickup address-search", "pickup-city", "pickup-state", "pickup-zip", "delivery address-search", "delivery-city", "delivery-state", "delivery-zip")
  end
end
