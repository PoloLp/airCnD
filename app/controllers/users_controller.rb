class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.desks = @user.list_desks
    @user.bookings = @user.list_bookings
  end
end
