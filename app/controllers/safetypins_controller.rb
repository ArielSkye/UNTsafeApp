class SafetypinsController < ApplicationController
  before_action :set_safetypin, only: [:show, :edit, :update, :destroy]

  # GET /safetypins
  # GET /safetypins.json
  def index
    @safetypins = Safetypin.all
    @hash = Gmaps4rails.build_markers(@safetypins) do |safetypin, marker|
    marker.lat safetypin.latitude
    marker.lng safetypin.longitude
    marker.infowindow safetypin.description

  end
  end

  # GET /safetypins/1
  # GET /safetypins/1.json
  def show
  end

  # GET /safetypins/new
  def new
    @safetypin = Safetypin.new
  end

  # GET /safetypins/1/edit
  def edit
  end

  # POST /safetypins
  # POST /safetypins.json
  def create
    @safetypin = Safetypin.new(safetypin_params)

    respond_to do |format|
      if @safetypin.save
        format.html { redirect_to @safetypin, notice: 'Safetypin was successfully created.' }
        format.json { render :show, status: :created, location: @safetypin }
      else
        format.html { render :new }
        format.json { render json: @safetypin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safetypins/1
  # PATCH/PUT /safetypins/1.json
  def update
    respond_to do |format|
      if @safetypin.update(safetypin_params)
        format.html { redirect_to @safetypin, notice: 'Safetypin was successfully updated.' }
        format.json { render :show, status: :ok, location: @safetypin }
      else
        format.html { render :edit }
        format.json { render json: @safetypin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safetypins/1
  # DELETE /safetypins/1.json
  def destroy
    @safetypin.destroy
    respond_to do |format|
      format.html { redirect_to safetypins_url, notice: 'Safetypin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safetypin
      @safetypin = Safetypin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safetypin_params
      params.require(:safetypin).permit(:latitude, :longitude, :address, :description)
    end
end
