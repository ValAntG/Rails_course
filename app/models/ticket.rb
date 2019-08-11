class Ticket < ApplicationRecord
  belongs_to :number, class_name: 'Train', foreign_key: :number
  belongs_to :user
  belongs_to :railway_station_first, class_name: 'RailwayStation', foreign_key: :railway_station_first_id
  belongs_to :railway_station_last, class_name: 'RailwayStation', foreign_key: :railway_station_last_id
end
