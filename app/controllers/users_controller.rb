class UsersController < ApplicationController

  def show
    redirect_to root_path, warning: "You are not authorized" unless @user = current_user
    @user = User.find(params[:id])
    @user_bookings = @user.bookings
  end

end
