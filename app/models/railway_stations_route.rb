class RailwayStationsRoute < ApplicationRecord
  validates :railway_station_id, uniqueness: {scope: :route_id}

  belongs_to :railway_station
  belongs_to :route

  has_many :tickets

  after_create :set_name

  private

  def set_name
    route_name = "#{route.railway_stations.first.title} - #{route.railway_stations.last.title}"
    route.update(name: route_name)
  end
end
