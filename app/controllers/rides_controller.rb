class RidesController < ApplicationController
  def create
    # raise params.inspect
    user = User.find(session[:user_id])
    attraction = Attraction.find(params[:attraction][:attraction_id])
    ride = Ride.create(
      user: user,
      attraction: attraction
    )
    message = ride.take_ride
    redirect_to user_path(user, message: message)
  end
end
