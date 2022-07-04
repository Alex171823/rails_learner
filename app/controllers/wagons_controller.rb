class WagonsController < ApplicationController
  before_action :set_wagon, only: %i[show edit update destroy]
  before_action :set_train, only: %i[destroy create]

  # GET /wagons
  def index
    @wagons = Wagon.all
  end

  # GET /wagons/1
  def show; end

  # GET /wagons/new
  def new
    @wagon = Wagon.new
  end

  # GET /wagons/1/edit
  def edit; end

  # POST /wagons
  def create
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save
      redirect_to @train
    else
      render @train
    end
  end

  # PATCH/PUT /wagons/1
  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to train_wagon_path, notice: 'Wagon was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wagons/1
  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to @train, notice: 'Wagon was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or conswagonts between actions.
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Only allow a list of trusted parameters through.
  def wagon_params
    params.require(:wagon).permit(:number, :type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
                                  :sitting_seats, :train_id)
  end
end
