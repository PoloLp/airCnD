require 'date'

class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @desk = Desk.find(params[:desk_id])

    @duration = (@booking.end_at).hour - (@booking.start_at).hour
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.desk = Desk.find(params[:desk_id])
    @booking.user = current_user
    if @booking.save
      redirect_to desk_booking_path(@booking[:desk_id], @booking)
    else
      render "desks/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_review_params)
      redirect_to desk_path(@booking.desk)
    else
      render "desks/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end

  def booking_review_params
    params.require(:booking).permit(:rating, :review)
  end

end
