class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:add, :edit, :destroy]
  before_action :authenticate_user!, only: [:new]

  def index # list of pins, read all
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
    marker.lat pin.latitude
    marker.lng pin.longitude
    end
  end

  def show # read
  end

  def new # opens new page to create pin
    @pin = current_user.pins.build
  end

  def edit # update
  end

  def create # actually creates pin
    @pin = current_user.pins.build(pin_params)

      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.'
      else
        render :new
      end
  end

  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @pin.destroy
      redirect_to pins_url, notice: 'Pin was successfully deleted.'
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Sorry, you are not authorized to edit this pin." if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
