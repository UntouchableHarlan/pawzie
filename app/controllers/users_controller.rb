class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to pets_up_path }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def zip
    @user = current_user.address
    render json: {address: current_user.address}
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :address, :password, :password_confirmation)
  end

end
