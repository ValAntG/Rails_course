class Train < ApplicationRecord
  validates :name, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
  belongs_to :route
  has_many :ticket
end
