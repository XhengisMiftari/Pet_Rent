class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end
end
