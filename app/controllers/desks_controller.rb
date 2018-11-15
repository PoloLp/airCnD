class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @desks = Desk.search_by_address_and_title("%#{params[:query]}%")
    else
      @desks = Desk.all
    end

    @markers = @desks.map do |desk|
      {
        lng: desk.longitude,
        lat: desk.latitude,
        infoWindow: { content: render_to_string(partial: "/desks/map_window", locals: { desk: desk }) }
      }
    end
  end

  def show
    @desk = Desk.find(params[:id])
    @booking = Booking.new

    @markers =
      {
        lng: @desk.longitude,
        lat: @desk.latitude,
        infoWindow: { content: render_to_string(partial: "/desks/map_window", locals: { desk: @desk }) }
      }
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = Desk.new(desk_params)
    @desk.user = current_user
    if @desk.save
      redirect_to desk_path(@desk)
    else
      render :new
    end
  end

  private

  def desk_params
    params.require(:desk).permit(:title, :address, :description,
                                 :price, :photo)
  end
end
