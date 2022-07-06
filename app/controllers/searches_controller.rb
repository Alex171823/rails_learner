class SearchesController < ApplicationController
  before_action :find_route, only: %i[show]

  private

  def find_route
    first_station_id = search_params[:first_station_id].to_i
    last_station_id = search_params[:last_station_id].to_i
    @routes_found = []
    Route.find_each do |route|
      stations_ordered = route.railway_stations.ordered_by_index
      if stations_ordered.first.id == first_station_id && stations_ordered.last.id == last_station_id
        @routes_found << route
      end
    end
    @routes_found
  end

  def search_params
    params.require(:search).permit(:first_station_id, :last_station_id)
  end
end
