class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @desks = Desk.all
  byebug
  end

  def show
    @desk = Desk.find(params[:id])
    @booking = Booking.new
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
