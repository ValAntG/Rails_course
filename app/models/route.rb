class Route < ApplicationRecord
  validates :name, uniqueness: true

  has_one :train

  has_many :railway_stations_routes
  has_many :railway_stations, -> { order('position') }, through: :railway_stations_routes
end
