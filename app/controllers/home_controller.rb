class HomeController < ApplicationController
  def index
    if params[:shelters]
      # Return the places on the google map
    end
  end

  def page
    @nearby = User.near([current_user.latitude, current_user.longitude]).all_except(current_user)
  end
end
