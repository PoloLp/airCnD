class BookingsController < ApplicationController

def create
  @booking = Booking.new(booking_params)
  @booking.desk = Desk.find(params[:desk_id])
  if @booking.save
    redirect_to desks_path
  else
    render "desks/show"
  end
end


private

 def booking_params
  params.require(:booking).permit(:start_at, :end_at)
 end

end
