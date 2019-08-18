class SearchesController < ApplicationController
  def show
    search_route
  end

  def new
  end

  def edit
  end

  private

  def search_route
    routes = Route.all
    stations = RailwayStation.all
    @search = {station_first: params[:station_first], station_last: params[:station_last], search_stations: []}
    routes.map do |route|
      search_stations = {}
      route.railway_stations_routes.map do |rsr|
        binding.pry
        if rsr.railway_station.title == @search[:station_first]
          search_stations[:station_first] = stations[rsr.id].title
          search_stations[:time_first] = rsr.departure
        end
        if search_stations.key?(:station_first) || rsr.railway_station.title == @search[:station_last]
          search_stations[:station_last] = stations[rsr.id].title
          search_stations[:time_list] = rsr.arrival
          search_stations[:route] = routes[rsr.route_id].name
        end
      end
      @search[:search_stations] << search_stations
    end
  end
end
