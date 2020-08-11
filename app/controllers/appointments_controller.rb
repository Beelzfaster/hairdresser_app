class AppointmentsController < ApplicationController

  def index
    @booking = Booking.find(params[:booking_id])
    @appointments = @booking.appointments
  end

  def show
    @booking = Booking.find(params[:booking_id])
    @appointment = @booking.appointments.find(params[:id])
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @appointment = @booking.appointments.build
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @booking.user = current_user
    @appointment = @booking.appointments.build(params.require(:appointment).permit(:information))
    if @appointment.save
      redirect_to booking_appointment_url(@booking, @appointment)
    else
      render :action => "new"
    end
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @appointment = @booking.appointments.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params.require(:appointment).permit(:information))
      redirect_to booking_appointment_url(@booking, @appointment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    respond_to do |format|
    format.html { redirect_to booking_appointments_path(@booking) }
    format.xml { head :ok }
    end
  end


end
