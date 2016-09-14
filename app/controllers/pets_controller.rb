class PetsController < ApplicationController
  def new
    @user = current_user
    @pet = @user.pets.build
  end

  def create
    @user = current_user
    @pet = @user.pets.build(pet_params)
    respond_to do |format|
      if @pet.save
        format.html { redirect_to home_path }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :info, :image)
  end
end
