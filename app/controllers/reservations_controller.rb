class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:new, :create]
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
  @pet = Pet.find(params[:pet_id])
  @reservation = Reservation.new(reservation_params)
  @reservation.pet = @pet
  @reservation.user = current_user

  if @reservation.save
    redirect_to reservation_path(@reservation), notice: "Reservation created!"
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
