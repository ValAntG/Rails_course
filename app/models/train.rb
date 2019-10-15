class Train < ApplicationRecord
  validates :name, uniqueness: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route, class_name: 'Route', foreign_key: :route_id

  has_many :carriages

  def place(type, place)
    self.carriages.where(type: type).sum(place.to_sym)
  end
end
