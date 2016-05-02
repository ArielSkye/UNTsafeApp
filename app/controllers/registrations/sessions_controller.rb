class Registrations::SessionsController < Devise::essionsController

	@users = User.all
@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude
	end

  # def new
  #   super
  # end

  # def create
  #   super
  # end
end
