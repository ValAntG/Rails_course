class RailwayStation < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
end
