class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    respond_to do |format|
      if @pet.save
        session[:user_id] = @pet.id
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
    params.require(:pet).permit(:name, :breed, :info)
  end
end
