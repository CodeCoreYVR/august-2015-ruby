class GuestsController < ApplicationController
  before_action :find_hotel, only: [:new, :create]

  def new
    @guest = Guest.new
  end

  def create
    @guest = @hotel.guests.new(params.require(:guest).permit([:name, :email]))
    if @guest.save
      redirect_to @hotel
    else
      render :new
    end
  end

  private

  def find_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
