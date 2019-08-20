class SearchesController < ApplicationController
  def show
    search_route
  end

  def new
    @stations = RailwayStation.all
  end

  def edit
  end

  def create
  end

  def search_route
    @search = {station_first: params[:station_first], station_last: params[:station_last]}
    @search_rsr = []
    station_first = RailwayStation.find_by(title: params[:station_first])
    station_last = RailwayStation.find_by(title: params[:station_last])
    # routes = Route.where(id:  RailwayStationsRoute.where(railway_station_id: params[:station_first_id]).select(:route_id))
    # .where(id:  RailwayStationsRoute.where(railway_station_id: params[:station_last_id]).select(:route_id))
    routes = station_first.routes & station_last.routes
    routes.each do |route|
      station_position, search_first_id = nil, nil
      route.railway_stations_routes.each do |rsr|

        if rsr.railway_station_id == station_first.id
          search_first_id = rsr.id
          station_position = rsr.position
        end

        if !station_position.nil? && rsr.railway_station_id == station_last.id && station_position < rsr.position
          search_last_id = rsr.id
          @search_rsr.push({first_id: search_first_id, last_id: search_last_id})
        end
      end
    end
  end
end
