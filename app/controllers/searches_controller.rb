class SearchesController < ApplicationController
  before_action :find_route, only: %i[show]

  private

  def find_route
    start_station = RailwayStation.find(search_params[:first_station_id].to_i)
    end_station = RailwayStation.find(search_params[:last_station_id].to_i)
    @routes_found = start_station.routes & end_station.routes
  end

  def search_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end