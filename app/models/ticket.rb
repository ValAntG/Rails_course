class Ticket < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :passport_series, presence: true
  validates :passport_numbers, presence: true

  belongs_to :train
  belongs_to :user
  belongs_to :railway_station_first, class_name: 'RailwayStation', foreign_key: :railway_station_first_id
  belongs_to :railway_station_last, class_name: 'RailwayStation', foreign_key: :railway_station_last_id
end
