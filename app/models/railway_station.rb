class RailwayStation < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id'
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
