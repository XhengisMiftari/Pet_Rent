class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet
  before_action :ensure_pet_available, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.pet = @pet

    if @reservation.save
      redirect_to @pet, notice: "Rented your buddy!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def ensure_pet_available
    unless @pet.availability
      redirect_to @pet, alert: "This buddy is not available"
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
