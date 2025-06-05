class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:new, :create, :show]
  before_action :ensure_pet_available, only: [:new, :create]
  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.pet = @pet

    if @reservation.save
      redirect_to pet_reservation_path(@pet, @reservation), notice: "Rented your buddy!"
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
