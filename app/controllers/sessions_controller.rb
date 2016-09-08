class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        format.html { redirect_to @user }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
