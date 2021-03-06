class Admin::RailwayStationsController < Admin::BaseController
  # must be at the first place
  before_action :set_railway_station, only: %i[show edit update destroy update_position]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show; end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit; end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html do
          redirect_to admin_railway_station_url(@railway_station), notice: 'Railway station was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:index_number])
    redirect_to admin_route_path(@route)
  end

  # PATCH/PUT /railway_stations/1
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html do
          redirect_to admin_railway_station_url(@railway_station), notice: 'Railway station was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to admin_railway_stations_path, notice: 'Railway station was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
