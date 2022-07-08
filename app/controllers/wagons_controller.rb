class WagonsController < ApplicationController
  before_action :set_wagon, only: %i[show update edit destroy]

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
    @wagon = Wagon.new(wagon_params)
    respond_to do |format|
      if @wagon.save
        format.html { redirect_to @wagon, notice: 'Wagon was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wagons/1
  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to @wagon, notice: 'Wagon was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wagons/1
  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to wagons_path, notice: 'Wagon was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or conswagonts between actions.
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wagon_params
    w_p = params.require(:wagon).permit(:number, :type, :top_seats, :bottom_seats, :side_top_seats,
                                        :side_bottom_seats, :train_id)
    # change type value form human-readable to rails-valid
    w_p[:type] = Wagon.wagon_types.key(w_p[:type])
    w_p
  end
end
