class BookingsController < ApplicationController

def show
  @booking = Booking.find(params[:id])
  @desk = Desk.find(params[:desk_id])

end

def create
  @booking = Booking.new(booking_params)
  @booking.desk = Desk.find(params[:desk_id])
  @booking.user = User.find(1)

  if @booking.save!
    redirect_to desk_booking_path(@booking[:desk_id], @booking)
  else
    render "desks/show"
  end
end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end
end
