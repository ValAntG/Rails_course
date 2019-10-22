class Train < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, inverse_of: :trains
  belongs_to :route, class_name: 'Route', foreign_key: :route_id, inverse_of: :train

  has_many :carriages, dependent: :destroy

  def place(type, place)
    carriages.where(type: type).sum(place.to_sym)
  end
end
