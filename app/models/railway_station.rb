class RailwayStation < ApplicationRecord
  validates :title, uniqueness: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
end
