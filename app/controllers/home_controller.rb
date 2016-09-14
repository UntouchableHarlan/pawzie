class HomeController < ApplicationController
  def index

  end

  def page
    @nearby = User.near([current_user.latitude, current_user.longitude])
  end

  
end
