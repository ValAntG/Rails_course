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
    @search = {station_first: params[:station_first], station_last: params[:station_last]}
    @search_route = []
    station_first = RailwayStation.find_by(title: params[:station_first])
    station_last = RailwayStation.find_by(title: params[:station_last])
    routes = station_first.routes&station_last.routes
    routes.map do |route|
      route.railway_stations_routes.map do |rsr|
        station_position = rsr.position if rsr.railway_station_id == station_first.id
        binding.pry
        route = rsr.route_id if rsr.railway_station_id == station_last.id && station_position.nil? OR station_position < rsr.position
        @search_route << route
      end
    binding.pry
    end



    # Route.all.each do |route|
    #   search_stations = {}
    #   route.railway_stations_routes.each do |rsr|
    #     if rsr.railway_station.title == @search[:station_first]
    #       search_stations[:station_first] = RailwayStation.find_by(id: rsr.railway_station_id)
    #       search_stations[:time_first] = rsr.departure
    #     end
    #     if search_stations.key?(:station_first) || rsr.railway_station.title == @search[:station_last]
    #       search_stations[:station_last] = RailwayStation.find_by(id: rsr.railway_station_id)
    #       search_stations[:time_list] = rsr.arrival
    #       search_stations[:route] = Route.find_by(id: rsr.route_id)
    #       @search[:search_stations] << search_stations
    #     end
    #   end
    # end
  end

   # def search_route
  #   station_first = RailwayStation.find_by(title: params[:station_first])
  #   station_last = RailwayStation.find_by(title: params[:station_last])
  #   rails_route_first = RailwayStationsRoute.where(railway_station: station_first)
  #   rails_route_last = RailwayStationsRoute.where("railway_station_id IN (?) AND position > ?",
  #                     station_last.id, rails_route_first.first.position)
  #   @routes = Route.joins(:railway_stations_routes).where("railway_stations_routes.railway_station_id = ? OR railway_stations_routes.railway_station_id = ? AND railway_stations_routes.position > ?", station_first.id, station_last.id, rails_route_first.position).uniq
  #   binding.pry
  #   @routs = Route.all
  #   binding.pry
  #   @search_station = { station_first: station_first.title, time_station_first: rails_route_first.departure,
  #                       station_last: station_last.title,
  #                       time_station_last: rails_route_last.arrival }
    # rails_route_second = RailwayStationsRoute.where("railway_station_id IN (?) AND position > ?", rails_route_first.ids, rails_route_first.first.position)
    #Route.joins(:railway_stations_routes).where("railway_stations_routes.railway_station_id = ? AND railway_stations_routes.position > ?", 2, 1).uniq
    # Route.joins(:railway_stations_routes)
    #   .where("railway_stations_routes.railway_station_id = ? AND railway_stations_routes.position > ?",
    #    rails_route_first.first.id, rails_route_first.first.position).uniq
  # end
end
