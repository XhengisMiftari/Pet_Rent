class PetsController < ApplicationController
  def index
    @pets = Pet.all
    if params[:query].present?
    @pets = @pets.where("species ILIKE ?", "%#{params[:query]}%")
  end

  end

  def show
    @pet = Pet.find(params[:id])
    @markers = [{lat: @pet.latitude, lng: @pet.longitude, info_window_html: render_to_string(partial: "info_window", locals: { pet: @pet })}] if @pet.geocoded?
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
end
