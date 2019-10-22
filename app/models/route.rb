class Route < ApplicationRecord
  validates :name, uniqueness: true

  has_one :train, dependent: :nullify

  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, -> { order('position') }, through: :railway_stations_routes
end
