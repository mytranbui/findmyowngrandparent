class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_grandparent, only: %i[new create destroy]

  # GET grandparents/:id/bookings
  def index
    @bookings = Booking.all
  end

   # GET "grandparents/:id/bookings/new"
  def new
    @booking = Booking.new
    @booking.grandparent.user = current_user
  end

  # POST "grandparents/:id/bookings"
  def create
    @booking = Booking.new(booking_params)
    @booking.grandparent = @grandparent
    @booking.grandparent.user = current_user
    if @booking.save
      redirect_to grandparent_path(@grandparent)
    else
      render :new, status: :unprocessable_entity
    end
  end

   # DELETE "bookings/:id"
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to grandparent_path(@booking.grandparent), status: :see_other
  end

  private

  def set_grandparent
    @grandparent = Grandparent.find(params[:grandparent_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
