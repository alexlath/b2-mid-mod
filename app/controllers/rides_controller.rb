class RidesController < ApplicationController
  def update
    ride = Ride.find(params[:id])
    @mechanic = Mechanic.find(params[:mechanic_id])
    ride.mechanics << @mechanic
    redirect_to "/mechanics/#{@mechanic.id}"
  end
end