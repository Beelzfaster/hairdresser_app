class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  require 'my_logger'

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
    if params[:search]
      @search_term = params[:search]
      @bookings = @bookings.search_by(@search_term)
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_user.bookings.build
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.user = current_user
    logger = MyLogger.instance
    logger.logInformation("A new booking made for: " + @booking.cut)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking.cut = params[:booking][:cut]
    @booking.wash = params[:booking][:wash]
    @booking.colour = params[:booking][:colour]
    updated_information = {
    "cut" => @booking.cut,
    "wash" => @booking.wash,
    "colour" => @booking.colour
    }
    respond_to do |format|
    if @booking.update(updated_information)
    format.html { redirect_to @booking, notice: 'booking was successfully updated.' }
    format.json { render :show, status: :ok, location: @booking }
    else
    format.html { render :edit }
    format.json { render json: @booking.errors, status: :unprocessable_entity }
    end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:cut, :wash, :colour)
    end
end
