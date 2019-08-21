class SearchesController < ApplicationController
  def show
    search_route
    @station_first = RailwayStation.find(params[:station_first_id])
    @station_last = RailwayStation.find(params[:station_last_id])
  end

  def new
    @stations = RailwayStation.all
  end

  def edit
  end

  def create
  end

  def search_route
    binding.pry
    @search_rsr = []
    routes = Route.includes(:railway_stations_routes)
                  .where(id: RailwayStationsRoute.where(railway_station_id: params[:station_first_id]).select(:route_id))
                  .where(id: RailwayStationsRoute.where(railway_station_id: params[:station_last_id]).select(:route_id))
    routes.each do |route|
      rsrs = route.railway_stations_routes
      firstrsr = rsrs.detect { |rsr| rsr.railway_station_id == params[:station_first_id].to_i }
      lastrsr = rsrs.detect { |rsr| rsr.railway_station_id == params[:station_last_id].to_i && rsr.position > firstrsr.position }
      @search_rsr.push({firstrsr: firstrsr, lastrsr: lastrsr, route: route}) if lastrsr
    end

  end
end
