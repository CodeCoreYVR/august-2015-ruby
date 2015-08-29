class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(params.require(:hotel).permit([:name, :location, :rooms]))
    if @hotel.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end
end
