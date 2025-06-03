class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end 
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to root_path, notice: 'Pet was born. Congratulations!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def pet_params
    params.require(:pet).permit(:species, :name, :price, :location, :availability)
  end
end
