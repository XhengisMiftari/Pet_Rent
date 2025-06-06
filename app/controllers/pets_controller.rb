class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update]
  before_action :authorize_pet_owner, only: [:edit, :update]

  def index
    @pets = Pet.all
    if params[:query].present?
    @pets = @pets.where("species ILIKE ?", "%#{params[:query]}%")
  end

  end

  def my_pets
  @pets = current_user.pets
  end

  def show
    @markers = [{lat: @pet.latitude, lng: @pet.longitude, info_window_html: render_to_string(partial: "info_window", locals: { pet: @pet })}] if @pet.geocoded?
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: "Pet updated!"
    else
      render :edit, status: :unprocessable_entity
    end
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
    params.require(:pet).permit(:species, :name, :price, :location, :availability, :photo)
  end

  def set_pet
  @pet = Pet.find(params[:id])
  end

  def authorize_pet_owner
    unless @pet.user == current_user
      redirect_to pets_path, alert: "You can only edit your own pets"
    end
  end
end
