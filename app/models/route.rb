class Route < ApplicationRecord
  validates :name, uniqueness: true

  has_many :trains
  has_many :railway_stations_routes, -> { order('position') }
  has_many :railway_stations, through: :railway_stations_routes

  has_many :railway_stations_trains
  
end
