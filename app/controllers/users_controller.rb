class UsersController < ApplicationController
  before_action :already_user?, only: [:new]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to new_user_pet_path(current_user) }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @pets = @user.pets
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def zip
    @longitude = current_user.longitude
    @latitude = current_user.latitude
    render json: {longitude: current_user.longitude, latitude: current_user.latitude}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :image, :address, :city, :state, :zip, :password, :password_confirmation)
  end

end
