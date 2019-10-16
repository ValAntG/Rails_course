class Route < ApplicationRecord
  validates :name, uniqueness: true

  has_one :train

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, -> { order('position') }, through: :railway_stations_routes

  def update_position(station, position, arrival, departure)
    route_station = route_station(station)
    route_station.update(position: position, arrival: arrival, departure: departure) if route_station
  end

  def position_in(station)
    route_station(station).try(:position)
  end

  def arrival_in(station)
    route_station(station).try(:arrival)
  end

  def departure_in(station)
    route_station(station).try(:departure)
  end

  # def destroy_station(position)
  #   binding.pry
  #   railway_stations_routes[position].delete
  # end

  protected

  def route_station(station)
    @route_station = railway_stations_routes.where(railway_station: station).first
  end
end
