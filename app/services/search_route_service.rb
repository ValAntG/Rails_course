module SearchRouteService
  def self.search(station_first_id, station_last_id)
    routes = search_route(station_first_id, station_last_id)
    search_railway_stations_in_route(routes, station_first_id, station_last_id)
  end

  def self.search_route(station_first_id, station_last_id)
    Route.includes(:railway_stations_routes)
         .where(id: RailwayStationsRoute.where(railway_station_id: station_first_id).select(:route_id))
         .where(id: RailwayStationsRoute.where(railway_station_id: station_last_id).select(:route_id))
  end

  def self.search_railway_stations_in_route(routes, station_first_id, station_last_id)
    @search_rsr = []
    routes.each do |route|
      rsrs = route.railway_stations_routes
      firstrsr = rsrs.detect { |rsr| rsr.railway_station_id == station_first_id.to_i }
      lastrsr = rsrs.detect do |rsr|
        rsr.railway_station_id == station_last_id.to_i && rsr.position > firstrsr.position
      end
      @search_rsr.push(firstrsr: firstrsr, lastrsr: lastrsr, route: route) if lastrsr
    end
    @search_rsr
  end
end
